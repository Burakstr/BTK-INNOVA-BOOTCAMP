import UIKit

class Hesaplayici {
    
    // 1. Dereceyi Fahrenheit'a dönüştüren metod
    func dereceyiFahrenheitaCevir(derece: Double) -> Double {
        return derece * 1.8 + 32
    }
    
    // 2. Dikdörtgenin çevresini hesaplayan metod
    func dikdortgenCevresi(kenar1: Double, kenar2: Double){
       let cevre =  2 * (kenar1 + kenar2)
        print("Dikdörtgenin çevresi : \(cevre)")
    }
    
    // 3. Faktöriyel hesaplayan metod
    func faktoriyel(sayi: Int) -> Int {
        if sayi == 0 {
            return 1
        }
        return sayi * faktoriyel(sayi: sayi - 1)
    }
    
    // 4. Bir kelime içindeki 'a' harflerinin sayısını bulan metod
    func aHarfiSayisi(kelime: String) -> Int {
        return kelime.lowercased().filter { $0 == "a" }.count
    }

    // 5. Parametre olarak girilen kenar sayısına göre iç açılar toplamını hesaplayan metod
    func icAciToplami(kenarSayisi: Int) -> Int {
        return (kenarSayisi - 2) * 180
    }

    // 6. Parametre olarak girilen gün sayısına göre maaş hesabı yapan metod
    func maasHesabi(gunSayisi: Int) -> Double {
        let gunlukCalismaSaati = 8
        let calismaSaatUcreti = 10.0
        let mesaiSaatUcreti = 20.0
        let mesaiLimiti = 160
        
        let toplamSaat = gunSayisi * gunlukCalismaSaati
        if toplamSaat <= mesaiLimiti {
            return Double(toplamSaat) * calismaSaatUcreti
        } else {
            let normalSaat = Double(mesaiLimiti) * calismaSaatUcreti
            let mesaiSaat = Double(toplamSaat - mesaiLimiti) * mesaiSaatUcreti
            return normalSaat + mesaiSaat
        }
    }

    // 7. Parametre olarak girilen kota miktarına göre ücreti hesaplayan metod
    func kotaUcreti(kotaGB: Int) -> Double {
        let temelUcret = 100.0 // 50 GB = 100 ₺
        let kotaLimiti = 50
        let ekstraUcret = 4.0 // Ekstra 1 GB = 4 ₺
        
        if kotaGB <= kotaLimiti {
            return temelUcret
        } else {
            let ekstraKota = kotaGB - kotaLimiti
            return temelUcret + (Double(ekstraKota) * ekstraUcret)
        }
    }
}

let hesaplayici = Hesaplayici()

let fahrenheit = hesaplayici.dereceyiFahrenheitaCevir(derece: 25)
print("Fahrenheit: \(fahrenheit)")

hesaplayici.dikdortgenCevresi(kenar1: 5, kenar2: 10)

let faktoriyelSonucu = hesaplayici.faktoriyel(sayi: 5)
print("Faktöriyel: \(faktoriyelSonucu)")

let aHarfSayisi = hesaplayici.aHarfiSayisi(kelime: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")

print("A harfi sayısı: \(aHarfSayisi)")

let icAciToplam = hesaplayici.icAciToplami(kenarSayisi: 5)
print("İç açılar toplamı: \(icAciToplam)")

let maas = hesaplayici.maasHesabi(gunSayisi: 20)
print("Maaş: \(maas)")

let kotaUcreti = hesaplayici.kotaUcreti(kotaGB: 55)
print("Kota ücreti: \(kotaUcreti)")
