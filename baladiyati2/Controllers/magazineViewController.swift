//
//  magazineViewController.swift
//  baladiyati2
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit



class MagazineController:UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var lists = [Institu]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
           
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mcell")
        let contentview = cell?.contentView
        
        let titre = contentview?.viewWithTag(1) as! UILabel
        let image = contentview?.viewWithTag(2) as! UIImageView
        let detail = contentview?.viewWithTag(3) as! UILabel
        image.image = UIImage(named: lists[indexPath.row].image!)
        titre.text = lists[indexPath.row].titre
        detail.text = lists[indexPath.row].detail
      
        return cell!
    }
    
  

    //Cellule OnClickListener
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = lists[indexPath.row] as! Institu
        performSegue(withIdentifier: "detail" , sender: item)
            }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {

           let parametre1 = sender as! Institu
            let destination = segue.destination as! DetailsViewController
            destination.titre = parametre1.titre!
            destination.detail = parametre1.detail
            destination.inst = parametre1
            
        }
    }
    override func viewDidLoad() {
    super.viewDidLoad()

  let a1 = Institu(titre: "L’intérêt de l'huile d’avocat pour la santé", detail: "L’avocat est un fruit qui est bon pour la santé. Riche en acides gras essentiels, en vitamines (notamment vitamine E) et en minéraux (potassium et magnésium), il contribue à une bonne santé cardiovasculaire. Peut-être moins connue, l’huile d’avocat est obtenue en pressant la pulpe charnue entourant le noyau d’avocat. L’huile d’avocat contient environ 70 % d’acide oléique (un acide gras monoinsaturé), 13% d'acide gras polyinsaturés (essentiellement de l’acide linoléique) et 12% de graisses saturées. Elle contient également de la vitamine E et des caroténoïdes qui lui confèrent des propriétés antioxydantes. Voici comment elle peut contribuer à rester en bonne santé." , image: "L’intérêt de l'huile d’avocat pour la santé")
   
        let a2 = Institu(titre: "10 plantes diurétiques", detail: "Pour vous aider à éliminer l’excès d’eau et de sel de votre organisme, nous vous proposons 10 plantes aux propriétés diurétiques évaluées scientifiquement.Les diurétiques sont des substances qui stimulent l’activité des reins et l’élimination des fluides. Ils permettent de limiter la rétention d’eau, de perdre du poids, de lutter contre les œdèmes, d’éliminer du sel et de prévenir l’hypertension artérielle. Mais certains médicaments diurétiques peuvent avoir des effets secondaires, ce qui peut conduire à chercher des alternatives naturelles.Voici 10 plantes dont les effets diurétiques ont fait l’objet d’études scientifiques. Cependant, beaucoup de ces recherches ont été réalisées sur l’animal et non chez l’homme, ce qui invite à rester prudent. Avant de choisir une plante, un complément alimentaire, prenez toujours conseil auprès d’un professionnel de santé, surtout si vous prenez d’autres traitements ou souffrez de maladies chroniques." , image: "10 plantes diurétiques")
        let a3 = Institu(titre: "La vitamine D protège-t-elle de la Covid-19 ?", detail: "La vitamine D a des effets bien connus pour aider à fixer le calcium sur les os et pour ces raisons elle est fréquemment prescrite aux enfants tout au long de leur croissance et aux personnes âgées en prévention de l’ostéopénie. Par ailleurs, d’autres études menées en Asie, exclusivement sur des enfants, ont aussi montré que la vitamine D peut moduler certaines fonctions immunitaires en cas d’infections respiratoires.Voilà sans doute pourquoi, un lien entre vitamine D et COVID, est aujourd’hui si largement mis en avant.Pour autant, dire que la vitamine D protège du COVID me semble prématuré. À ce stade, différentes équipes médicales dans le monde ont constaté qu’il y avait davantage de Covid + chez les gens carencés en vitamine D. Mais attention aux raccourcis: cette association statistique, ne prouve en aucun cas le lien decausalité." , image: "La vitamine D protège-t-elle de la Covid-19 ?")
        
        let a4 = Institu(titre: "Faut-il vraiment « booster » son immunité ?", detail: "La vitamine D a des effets bien connus pour aider à fixer le calcium sur les os et pour ces raisons elle est fréquemment prescrite aux enfants tout au long de leur croissance et aux personnes âgées en prévention de l’ostéopénie. Par ailleurs, d’autres études menées en Asie, exclusivement sur des enfants, ont aussi montré que la vitamine D peut moduler certaines fonctions immunitaires en cas d’infections respiratoires.Voilà sans doute pourquoi, un lien entre vitamine D et COVID, est aujourd’hui si largement mis en avant.Pour autant, dire que la vitamine D protège du COVID me semble prématuré. À ce stade, différentes équipes médicales dans le monde ont constaté qu’il y avait davantage de Covid + chez les gens carencés en vitamine D. Mais attention aux raccourcis: cette association statistique, ne prouve en aucun cas le lien decausalité." , image: "Faut-il vraiment « booster » son immunité ?")
        
        let a5 = Institu(titre: "Hypertrophie de la prostate : la vitamine D semble bénéfique", detail: "La vitamine D a des effets bien connus pour aider à fixer le calcium sur les os et pour ces raisons elle est fréquemment prescrite aux enfants tout au long de leur croissance et aux personnes âgées en prévention de l’ostéopénie. Par ailleurs, d’autres études menées en Asie, exclusivement sur des enfants, ont aussi montré que la vitamine D peut moduler certaines fonctions immunitaires en cas d’infections respiratoires.Voilà sans doute pourquoi, un lien entre vitamine D et COVID, est aujourd’hui si largement mis en avant.Pour autant, dire que la vitamine D protège du COVID me semble prématuré. À ce stade, différentes équipes médicales dans le monde ont constaté qu’il y avait davantage de Covid + chez les gens carencés en vitamine D. Mais attention aux raccourcis: cette association statistique, ne prouve en aucun cas le lien decausalité." , image: "Hypertrophie de la prostate : la vitamine D semble bénéfique")
        
        let a6 = Institu(titre: "Un bon sommeil aiderait à réduire le risque d’insuffisance cardiaque", detail: "La vitamine D a des effets bien connus pour aider à fixer le calcium sur les os et pour ces raisons elle est fréquemment prescrite aux enfants tout au long de leur croissance et aux personnes âgées en prévention de l’ostéopénie. Par ailleurs, d’autres études menées en Asie, exclusivement sur des enfants, ont aussi montré que la vitamine D peut moduler certaines fonctions immunitaires en cas d’infections respiratoires.Voilà sans doute pourquoi, un lien entre vitamine D et COVID, est aujourd’hui si largement mis en avant.Pour autant, dire que la vitamine D protège du COVID me semble prématuré. À ce stade, différentes équipes médicales dans le monde ont constaté qu’il y avait davantage de Covid + chez les gens carencés en vitamine D. Mais attention aux raccourcis: cette association statistique, ne prouve en aucun cas le lien decausalité." , image: "Un bon sommeil aiderait à réduire le risque d’insuffisance cardiaque")
        
        let a7 = Institu(titre: "Comment vos repas influent sur votre sommeil", detail: "Le lien entre alimentation et sommeil est réel mais complexe. Voici ce qu’il faut retenir.Il y a beaucoup de travaux sur l’alimentation et le sommeil, et beaucoup sont contradictoires. Est-ce à dire que ce que nous mangeons n’influe pas sur notre sommeil ? Non, on en sait désormais assez pour faire des préconisations. Mais les fausses pistes n’ont pas manqué, en particulier parce que bien des études étaient trop limitées ou financées par l’industrie agro-alimentaire.Quelques études biaiséesUn essai financé par le plus grand distributeur de kiwis au monde a trouvé qu’en mangeant deux kiwis une heure avant le coucher pendant quatre semaines on s’endort plus vite, on dort plus longtemps et on est plus reposé. Les auteurs de l'étude expliquent ces résultats par la présence en grande quantité d'antioxydants dans les kiwis. Mais l'étude n’avait pas de groupe « contrôle » et son intérêt est donc anecdotique." , image: "Comment vos repas influent sur votre sommeil")
        
        let a8 = Institu(titre: "Confinement : gare aux kilos émotionnels !", detail: "Des personnes stressées par le contexte de pandémie se mettent parfois à manger plus que d’habitude et à grossir.Pourquoi c’est importantAvec le confinement, beaucoup d’adultes ont dû stopper leurs activités sportives en club (tennis, volley…) ou en salle de fitness. Nous nous retrouvons chez nous, parfois seuls, ce qui peut augmenter le stress et l’anxiété chez certaines personnes. Parfois, la nourriture est un moyen de (mal) gérer son stress ou se consoler : chocolat, chips, sucreries et autres douceurs cachées dans les placards de la cuisine suscitent de nombreuses tentations.Inversement, le fait d’être plus souvent à la maison peut nous inciter à cuisiner plus, et donc à manger moins de produits ultra-transformés. Cette situation épidémique devrait durer dans le temps. Aussi il serait bon de corriger certains comportements s’ils s’avèrent néfastes.L’étudeEn avril-mai 2020, les auteurs ont enquêté sur 7753 adultes dans différents pays : Canada, Australie, Royaume-Uni, Irlande, États-Unis. La majorité des participants étaient des femmes et leur moyenne d’âge s’établissait à 51 ans. Environ un tiers étaient obèses et un tiers en surpoids. Pour cette étude parue dans le journal Obesity., les scientifiques cherché à savoir comment la population a modifié ses habitudes en matière d’alimentation et d’exercice pendant le premier confinement." , image: "Confinement : gare aux kilos émotionnels !")
        let a9 = Institu(titre: "Le virus qui a confiné le monde : 2020, une année pas comme les autres", detail: "Le virus qui a confiné le monde : 2020, une année pas comme les autresLa COVID-19 est partout, littéralement, et en 2020, sa propagation et son impact sur les populations de toutes les régions du monde ont conduit à une crise mondiale d'une portée et d'une proportion sans précédent. ONU Info revient sur certains des moments clés des 12 derniers mois.Le virus qui a confiné le monde : la crise de l’éducationCette année, l'éducation des enfants du monde entier a été gravement perturbée, alors que les écoles ont lutté pour faire face aux fermetures et réouvertures répétées et au passage à la scolarité en ligne, lorsque celle-ci était possible. Les enfants défavorisés ont cependant été les plus touchés par les mesures d'urgence.Le virus qui a confiné le monde : le fossé béant entre riches et pauvres Les inégalités entre les riches et les pauvres se sont aggravées pendant la pandémie de COVID-19 et la pauvreté s'est accrue, pour la première fois depuis des décennies. ONU Info examine comment la pandémie a fait reculer les efforts pour créer des sociétés plus équitables." , image: "image1")
        lists.append(a1)
        lists.append(a2)
        lists.append(a3)
        lists.append(a4)
        lists.append(a5)
        lists.append(a6)
        lists.append(a7)
        lists.append(a8)
        lists.append(a9)
        // Do any additional setup after loading the view.
}


/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/

}
