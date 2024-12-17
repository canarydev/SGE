from odoo import models, fields, api
from odoo.exceptions import UserError
import base64
import csv
import io

class Review(models.Model):
    _name = 'wine_reviews_base.review'
    _description = 'Reviews'

    country = fields.Many2one(comodel_name= "res.country",
                              string="País",
                              store=True)
    _country_image_url = fields.Char(related="country.image_url",
                                     string="Image URL",
                                     store=False)
    
    description = fields.Text(string="Descripción")
    _description_preview = fields.Char(string="Preview descripción",
                                       compute="_compute_description_preview",
                                       store=False)

    points = fields.Integer(string="Puntuación")
    points_classifier = fields.Integer(compute="_compute_points_classifier",
                                       readonly=True,
                                       store=True)
    points_html = fields.Html(string="U. Clasif.",
                              compute="_compute_points_html",
                              sanitize=False,
                              readonly=True,
                              store=False)

    price = fields.Float(string="Precio")

    province = fields.Many2one(comodel_name= "wine_reviews_base.province",
                               string ="Provincia",
                               store=True)
    region_1 = fields.Many2one(comodel_name= "wine_reviews_base.region",
                               string="Región 1")
    region_2 = fields.Many2one(comodel_name= "wine_reviews_base.region",
                               string="Región 2")

    taster = fields.Many2one(comodel_name="wine_reviews_base.taster",
                             string="Catador")
    twitter_account = fields.Char(related='taster.twitter_account',
                                  string="Cuenta de Twitter",
                                  store=False)

    title = fields.Char(string="Título")
    wine = fields.Many2one(comodel_name="wine_reviews_base.wine",
                           string="Vino")
    variety = fields.Many2many(comodel_name="wine_reviews_base.variety",
                               string="Uva")
    winery = fields.Many2one(comodel_name="wine_reviews_base.winery",
                             string="Bodega")
    wine_vintage = fields.Integer(string="Añada")

    @api.depends('title')
    def _compute_wine_vintage(self):
        for record in self:
            record.wine_vintage = self.extract_year(record.title)

    @api.depends('description')
    def _compute_description_preview(self):
        for record in self:
            record._description_preview = (record.description[:100] + '...') if record.description and len(record.description) > 20 else record.description

    @api.depends('points')
    def _compute_points_classifier(self):
        for record in self:
            if record.points <= 85:
                record.points_classifier = 0
            elif record.points <= 90:
                record.points_classifier = 1
            else:
                record.points_classifier = 2

    def _get_color(self, classifier):
        colors = {
            0: '#ff5e5e',  # rojo claro
            1: '#ffe600',  # amarillo
            2: '#008000'   # verde
        }
        return colors.get(classifier, '#000000')  # negro por defecto

    def _get_classifier_label(self, classifier):
        labels = {
            0: 'good',
            1: 'very good',
            2: 'excelent'
        }
        return labels.get(classifier, 'unknown')

    @api.depends('points_classifier')
    def _compute_points_html(self):
        for record in self:
            color = self._get_color(record.points_classifier)
            label = self._get_classifier_label(record.points_classifier)
            record.points_html = f"""
            <div style='width: 20px; height: 20px; background-color: {color};' title='{record.points}, {label}'></div>"""
    