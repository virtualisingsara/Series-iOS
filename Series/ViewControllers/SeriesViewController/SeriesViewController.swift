//
//  SeriesViewController.swift
//  Series
//
//  Created by ÁLVARO BARRADO FERNÁNDEZ on 1/10/18.
//  Copyright © 2018 ÁLVARO BARRADO FERNÁNDEZ. All rights reserved.
//

import UIKit

class SeriesViewController: UIViewController {
    @IBOutlet weak var siguienteBoton: UIButton!
    @IBOutlet weak var atrasBoton: UIButton!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var titulos: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var bg: UIImageView!
    internal var series: [Serie] = []
    internal var indexCurrentSerie = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Series"
        setupBUttonsItems()
        loadAllSeries()
        refresUIWithSerie(series[indexCurrentSerie])

        siguienteBoton.layer.cornerRadius=5.0
        siguienteBoton.layer.masksToBounds=true
        siguienteBoton.layer.borderWidth=2.0
        siguienteBoton.layer.borderColor=UIColor.white.cgColor
    
        atrasBoton.layer.cornerRadius=5.0
        atrasBoton.layer.masksToBounds=true
        atrasBoton.layer.borderWidth=2.0
        atrasBoton.layer.borderColor=UIColor.white.cgColor
    }
    
    private func refresUIWithSerie(_ serie: Serie){
        titulos.text = serie.name
        image.image = UIImage(named: serie.imageFile)
        bg.image = UIImage(named: serie.imageFile)
        desc.text = serie.summary
    }
    
    private func setupBUttonsItems(){
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
        navigationItem.setLeftBarButton(cancelBarButton, animated: false)
        let actorsBarButton = UIBarButtonItem(title: "Actors", style: .plain, target: self, action: #selector(actorsPressed))
        navigationItem.setRightBarButton(actorsBarButton, animated: false)
        
    }
    @objc private func cancelPressed(){
   dismiss(animated: true, completion: nil)
    }
    
    @objc private func actorsPressed(){
        let actorsVC = ActorsViewController()
        navigationController?.pushViewController(actorsVC, animated: true)
    }
    
    private func loadAllSeries(){
        let breakingBad = Serie(name: "Breking bad", imageFile: "breaking", summary: "AAAAAAAAAAAAAAAAAAA", seasons: 6)
        let betterCallSaul = Serie(name: "Better Call Saul", imageFile: "saul", summary: "AAAAAAAAAAAAAAAAAA", seasons: 3)
        let gameOfThrones = Serie(name: "Game of Thrones", imageFile: "thrones", summary: "AAAAAAAAAAAAAAAAAAAAAAA", seasons: 8)
        series.append(gameOfThrones)
        series.append(breakingBad)
        series.append(betterCallSaul)

    }
    
    @IBAction func next(){
        indexCurrentSerie = indexCurrentSerie + 1
        if indexCurrentSerie == series.count {
            print("reset")
            indexCurrentSerie = 0 }
        print("next")
        print(indexCurrentSerie)
            refresUIWithSerie(series[indexCurrentSerie])
        }
    
    @IBAction func back(){
        if indexCurrentSerie == 0 {
            print("reset")
            indexCurrentSerie = series.count }
        indexCurrentSerie = indexCurrentSerie - 1
        print("back")
        print(indexCurrentSerie)
        refresUIWithSerie(series[indexCurrentSerie])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
