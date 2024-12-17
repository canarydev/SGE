from odoo import models, fields, api

class Taster(models.Model):
    _name = 'wine_reviews_base.taster'
    _description = 'Taster'

    name = fields.Char(string="Crítico")
    twitter_account = fields.Char(string="Usuario Twitter")
    num_of_reviews = fields.Integer(compute='_compute_reviews_data', string = "Número de críticas", readonly=True)
    points_average = fields.Float(compute='_compute_reviews_data', string = "Puntuación media")
    review_ids = fields.One2many(
        comodel_name='wine_reviews_base.review',
        inverse_name='taster',
        string='Críticas'
    )
    
    @api.depends('review_ids')
    def _compute_reviews_data(self):
        for taster in self:
            taster.num_of_reviews = len(taster.review_ids)
            
            if taster.review_ids:
                total_points = sum(review.points for review in taster.review_ids)
                taster.points_average = total_points / taster.num_of_reviews
            else:
                taster.points_average = 0

    @api.depends('review_ids')
    def _compute_description_preview(self):
        for record in self:
            record._description_preview = (record.review_ids.description[:100] + '...') if record.description and len(record.description) > 20 else record.description


    

