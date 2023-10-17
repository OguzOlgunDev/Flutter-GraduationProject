class News {
  String imgPath;
  String name;
  String desc;
  String date;
  News(this.imgPath, this.name, this.desc, this.date);

  static List<News> generateNews() {
    return [
      News(
          "assets/images/news1.jpg",
          "Üreticiler, Yeni Tarım Teknolojileri İle Verimlilik Artışı Sağlıyor",
          "Tarım sektöründe son teknolojik gelişmeler, çiftçilere büyük avantajlar sağlamaktadır. "
              "Yapay zeka, sensör teknolojileri ve otomatik tarım makineleri gibi yeniliklerle donatılan modern tarım araçları, "
              "verimliliği artırmakta ve üretim maliyetlerini azaltmaktadır. Üreticiler, bu teknolojileri kullanarak daha hassas tarım uygulamaları gerçekleştirebilmekte "
              "ve tarlalarını daha etkin bir şekilde yönetebilmektedir."
              "Tarım sektöründe son teknolojik gelişmeler, çiftçilere büyük avantajlar sağlamaktadır. "
              "Yapay zeka, sensör teknolojileri ve otomatik tarım makineleri gibi yeniliklerle donatılan modern tarım araçları, "
              "verimliliği artırmakta ve üretim maliyetlerini azaltmaktadır. Üreticiler, bu teknolojileri kullanarak daha hassas tarım uygulamaları gerçekleştirebilmekte "
              "ve tarlalarını daha etkin bir şekilde yönetebilmektedir."
              "Tarım sektöründe son teknolojik gelişmeler, çiftçilere büyük avantajlar sağlamaktadır. "
              "Yapay zeka, sensör teknolojileri ve otomatik tarım makineleri gibi yeniliklerle donatılan modern tarım araçları, "
              "verimliliği artırmakta ve üretim maliyetlerini azaltmaktadır. Üreticiler, bu teknolojileri kullanarak daha hassas tarım uygulamaları gerçekleştirebilmekte "
              "ve tarlalarını daha etkin bir şekilde yönetebilmektedir.",
          "02/08/2023"),
      News(
          "assets/images/news2.jpg",
          "Organik Tarım Üretimi İle Sağlıklı Gıdaya Olan Talep Artıyor",
          "Son yıllarda, insanların sağlıklı ve doğal gıdaya olan ilgisi artmaktadır. "
              "Bu bağlamda organik tarım üretimi, önemli bir popülarite kazanmaktadır. Çiftçiler, kimyasal gübreler ve pestisitler kullanmadan, toprağı ve bitkileri "
              "doğal yöntemlerle besleyerek organik tarım üretimi gerçekleştirmektedir."
              " Organik ürünlere olan talebin artmasıyla birlikte, çiftçiler organik tarım yöntemlerine geçiş yaparak pazar taleplerine yanıt vermeyi hedeflemektedir.",
          "02/08/2023"),
      News(
          "assets/images/news3.jpg",
          "İklim Değişikliği, Çiftçilerin Üretim Stratejilerini Yeniden Şekillendiriyor",
          "Küresel iklim değişikliği, tarım sektöründe önemli zorluklar yaratmaktadır. "
              "Artan sıcaklık, düzensiz yağışlar ve yoğun hava olayları gibi faktörler, çiftçilerin üretim stratejilerini yeniden gözden geçirmesini gerektirmektedir. "
              "Çiftçiler, iklim değişikliğiyle başa çıkmak için su yönetimi, toprak koruma ve iklim uyumlu"
              " tarım teknikleri gibi önlemler almaktadır. Aynı zamanda, iklim değişikliğine dayanıklı bitki çeşitlerinin kullanımı da yaygınlaşmaktadır",
          "02/08/2023"),
      News(
          "assets/images/news4.jpg",
          "Tarım Sektöründe Dijital Pazarlama Trendleri Yükselişte",
          "Dijital teknolojilerin hızla gelişmesiyle birlikte tarım sektöründe dijital pazarlama faaliyetleri de önem kazanmaktadır. "
              "Çiftçiler, sosyal medya platformları, çevrimiçi pazar yerleri ve diğer dijital kanallar aracılığıyla ürünlerini "
              "tanıtabilmekte ve tüketiciyle doğrudan iletişim kurabilmektedir. Ayrıca, tarım teknolojileri şirketleri, "
              "çiftçilere dijital pazarlama araçları sunarak, ürünlerini daha geniş kitlelere ulaştırmalarına yardımcı olmaktadır.",
          "02/08/2023"),
    ];
  }
}
