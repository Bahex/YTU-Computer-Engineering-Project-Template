#import "/template/main.typ": template

#set text(lang: "tur")

#show: template.with(
  title: [PROJE KİTABI HAZIRLAMA ESASLARI VE LATEX TASLAĞI KULLANIMI],
  thesis_type: "BİLGİSAYAR PROJESİ",
  advisor: "Dr. Ahmet ELBİR",
  date: [Kasım, 2024],
  doc_type: "sw",
  students: (
    (
      name: "ENES ÖZELBAŞ",
      no: "19011001",
      birthdate: datetime(year: 2020, month: 6, day: 3),
      birthplace: "İstanbul",
      email: "ytu@std.yildiz.tr",
      phone: "0 555 555 55 55",
    ),
    (
      name: "YUNUS KARATEPE",
      no: "19011002",
      birthdate: datetime(year: 2020, month: 6, day: 3),
      birthplace: "İstanbul",
      email: "ytu@std.yildiz.tr",
      phone: "0 555 555 55 56",
    ),
  ),
  keywords: (
    "Demiryolu trafik kontrolü",
    "Trenlerarası çatışmalar",
    "Yeniden çizelgeleme",
    "Genetik algoritmalar",
    "Yapay sinir ağları",
  ),
  abstract: [
    Ulaştırma alt sistemlerinden biri olan demiryolu, diğer ulaştırma alt
    sistemleriyle yoğun bir rekabet halinde bulunmaktadır. Yürütüle gelen
    yanlış politikalar sonucu ülkemizde demiryolu ulaştırmasına olan talep,
    yolcu ve yük taşımacılığında karayolunun oldukça gerisinde kalmıştır.
    Demiryolunun pazar payını arttırması ve rekabetini devam ettirebilmesi için
    hizmet kalitesini arttırması gerekmektedir. Dakiklik ve güvenilirlik bir
    ulaştırma alt sisteminin kalitesini belirleyen ölçütlerin başında
    gelmektedir. Bu ölçütlerin istenilen seviyede tutulabilmesi de kısmen etkin
    trafik kontrolü ile sağlanabilir.

    Trenler önceden hazırlanmış bir hareket planına uygun biçimde hareket
    etmektedir. Ancak beklenmedik bazı olayların gerçekleşmesi sonucu
    gecikmeler ve trenler arası çatışmalar meydana gelebilmektedir. Trafik
    kontrolü, trenler arası çatışmaları, gecikmeleri mümkün olduğunca azaltacak
    şekilde çözüp, yeni bir uygulanabilir çizelge hazırlamak için uygulanır.
    Problemin zorluk derecesi nedeniyle, problemin en az gecikme içeren
    çözümüne kabul edilebilir bir süre içerisinde ulaşılması imkânsızdır. Bu
    çalışmada, 5 dakika gibi kısa bir süre içerisinde uygulanabilir ve gecikme
    toplamının olabildiğince küçüklendiği bir çizelge hazırlamak için, genetik
    algoritmalar kullanılmıştır. Geliştirilen algoritmanın çözümleri, belirli
    boyuttaki problemlerin kesin ve dispeçer çözümleri (yapay sinir ağı) ile
    karşılaştırıldığında, algoritma kısa sürede yeteri kadar iyi sonuçlar
    vermektedir. Algoritmanın uygulanması için geliştirilen bilgisayar
    programı, tren dispeçerleri için bir karar destek sistemi olarak da
    kullanılabilir.

    Trenler önceden hazırlanmış bir hareket planına uygun biçimde hareket
    etmektedir. Ancak beklenmedik bazı olayların gerçekleşmesi sonucu
    gecikmeler ve trenler arası çatışmalar meydana gelebilmektedir. Trafik
    kontrolü, trenler arası çatışmaları, gecikmeleri mümkün olduğunca azaltacak
    şekilde çözüp, yeni bir uygulanabilir çizelge hazırlamak için uygulanır.
    Problemin zorluk derecesi nedeniyle, problemin en az gecikme içeren
    çözümüne kabul edilebilir bir süre içerisinde ulaşılması imkânsızdır. Bu
    çalışmada, 5 dakika gibi kısa bir süre içerisinde uygulanabilir ve gecikme
    toplamının olabildiğince en küçüklendiği bir çizelge hazırlamak için,
    genetik algoritmalar kullanılmıştır. Geliştirilen algoritmanın çözümleri,
    belirli boyuttaki problemlerin kesin ve dispeçer çözümleri (yapay sinir
    ağı) ile karşılaştırıldığında, algoritma kısa sürede yeteri kadar iyi
    sonuçlar vermektedir. Algoritmanın uygulanması için geliştirilen bilgisayar
    programı, tren dispeçerleri için bir karar destek sistemi olarak da
    kullanılabilir.
  ],
  symbols: [
    / Ai: Activities of Daily Life
    / c: Alternate Step Test
    / C: Body Mass Index
    / CR: Cross Step moving on Four Stops
    / $f c (.)$: Dynamic Bayesian Networks
    / $Delta H$: Demura's Fall Risk Assessment Chart
    / $lambda i$: Electromyography
    / $Omega$: Faculdade de Engenharia da Universidade do Porto
  ],
  abbreviations: [
    / ADL: Activities of Daily Life
    / AST: Alternate Step Test
    / BMI: Body Mass Index
    / CSFT: Cross Step moving on Four Stops
    / DBN: Dynamic Bayesian Networks
    / DFRAC: Demura's Fall Risk Assessment Chart
    / EMG: Electromyography
    / FEUP: Faculdade de Engenharia da Universidade do Porto
    / FPRI: Fall Prediction and Risk Index
    / FR: Fall Probability
    / FRI: Fall Risk Index
    / GDP: Gross Domestic Product
    / GUGT: Get-Up-ang-Go Test
    / LABIOMEP: Laboratório de Biomecânica do Porto
    / MEMs: Micro-Electromechanics
    / MTC: Minimum Toe Clearance
    / PCA: Principal Components Analysis
    / PPA: Physiological Profile Assessment
    / PPP: Purchasing Power Parities
    / SMWT: Six Meter Walking Test
    / STRATIFY: Saint Thomas's Risk Assessment Tool in Falling Elderly Inpatients
    / STST: Sit-To-Stand Test
    / STST5: Sit-To-Stand Test with 5 repetitions
    / SVM: State Vector Machine
    / SWHSA: Smart Wearable Health Systems and Applications
    / TUGT: Timed Up-and-Go Test
    / USB: Universal Serial Bus
    / USUST: Unstructured and Unsupervised Test
    / WEFAPS: Wearable Fall Assessment \& Prediction System
    / WHO: World Health Organization
  ],
  acknowledgement: [
    Yıldız Technical University is one of the seven government universities
    situated in İstanbul besides being the 3rd oldest university of Turkey with
    its history dating back to 1911.It is regarded as one of the best
    universities in the country as well. Our university has 10 Faculties, 2
    Institutes, the Vocational School of Higher Education, the Vocational
    School for National Palaces and Historical Buildings, the Vocational School
    for Foreign Languages and more than 25,000 students.

    The Istanbul State Engineering and Architectural Academy and affiliated
    schools of engineering and the related faculties and departments of the
    Kocaeli State Engineering and Architecture Academy and the Kocaeli
    Vocational School were merged to form Yıldız University with decree law
    no.41 dated 20 June 1982 and Law no. 2809 dated 30 March 1982 which
    accepted the decree law with changes.

    The new university incorporated the departments of Science-Literature and
    Engineering, the Vocational School in Kocaeli, a Science Institute, a
    Social Sciences Institute and the Foreign Languages, Atatürk Principles and
    the History of Revolution, Turkish Language, Physical Education and Fine
    Arts departments affiliated with the Rectorate.

    Yıldız Technical University is one of the seven government universities
    situated in İstanbul besides being the 3rd oldest university of Turkey with
    its history dating back to 1911.It is regarded as one of the best
    universities in the country as well.
  ],
)

= GİRİŞ

Giriş bölümü, okuyucunun konuyu anlayıp projenin amacını ve konuya nasıl bir
katkıda bulunduğunu değerlendirilmesi için yeterli temel bilgileri içermelidir.
Bu amaçla projenin konusu tanımlanmalı, çalışmanın yapılmasının gereği, amacı
ve hedefi kısaca anlatılmalıdır. Projenin motivasyonu; bir başka deyişle, bu
konunun seçiliş sebebi ve konunun neden önemli olduğu, giriş bölümünde iyi bir
şekilde vurgulanmalıdır. Ayrıca projenin konuya olan özgün katkısı varsa giriş
bölümünde açık bir şekilde anlatılmalıdır. Bunların yanında proje çalışmasının
anlaşılabilmesi için bilinmesi gereken ön bilgiler, giriş bölümünde okuyucuya
aktarılmalıdır. Giriş bölümünün sonunda okuyucunun hangi bölümleri okuyacağına
karar vermesini kolaylaştırmak için proje kitabının sonraki bölümleri kısaca
tanıtılmalıdır.

#figure(
  image("template/ytu_logo.png", width: 25%),
  caption: [YTU logosu],
)

#figure(
  table(
    columns: (1fr, 2fr),
    stroke: none,
    table.vline(),
    table.hline(),
    [*Minimum Requirements*],
    table.vline(),
    [*Current Hardware*],
    table.hline(),
    table.vline(),
    [*CPU*: 8 cores], [#lorem(5)],
    [CPU: 8 cores], [#lorem(5)],
    [CPU: 8 cores], [#lorem(5)],
    [CPU: 8 cores], [#lorem(5)],
    table.hline(),
  ),
  caption: [Tablo örneği],
)

// #include "SW.typ"
#include "ARGE.typ"