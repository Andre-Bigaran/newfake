import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: Page1(),
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
  ));
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notícias'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pesquisar',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                      onSubmitted: (query) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Page3(query: query),
                          ),
                        );
                      },
                    ),
                  ),
                  CarouselSlider(
                    items: [
                      buildCarouselItem(Colors.red, 'Algoritmos', 'https://media.istockphoto.com/id/1283432364/pt/foto/financial-graph-and-technology-element-on-mobile-phone-3d-rendering.jpg?s=612x612&w=0&k=20&c=buKioo5yes1LKdqwjELWu1ouRJuaPGoeveF5sjUKj2s='),
                      buildCarouselItem(Colors.green, 'Internet das Coisas', 'https://media.istockphoto.com/id/1264846810/pt/foto/close-up-man-hand-holding-smartphone-to-access-on-banking-application-to-checking-about.jpg?s=612x612&w=0&k=20&c=sc1_mTNAlnD5t4uoTt7SDiS32f98bLvCbXD8hziB4BA='),
                      buildCarouselItem(Colors.blue, 'Inteligência Artificial', 'https://media.istockphoto.com/id/1390456645/pt/foto/metaverse-and-blockchain-technology-concepts-person-with-an-experiences-of-metaverse-virtual.jpg?s=612x612&w=0&k=20&c=hGncKD0HVaRnxoaBNA21iTLVcFRaKOVz8BeS364f4f4='),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                  buildSectionTitle('Categorias'),
                  buildCategorias(),
                  buildSectionTitle('Notícias'),
                  buildCardsDeNoticias(),
                  buildSectionTitle('Top Assuntos'),
                  buildTopAssuntos(),
                ],
              ),
            ),
          ),
          buildNavbar(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Page2(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildCarouselItem(Color color, String title, String imageUrl) {
    return GestureDetector(
      onTap: () {
        // Adicione ação para expandir a notícia aqui
        // Por exemplo, você pode navegar para uma página de detalhes da notícia.
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildCategorias() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildCategoriaChip('Tecnologia'),
        buildCategoriaChip('Esportes'),
        buildCategoriaChip('Política'),
        buildCategoriaChip('Entretenimento'),
      ],
    );
  }

  Widget buildCategoriaChip(String label) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }

  Widget buildCardsDeNoticias() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildCardDeNoticia(
            'Cozinha inteligente? Samsung lança app com IA e integração com eletros',
            'Descrição da Notícia 1',
            'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
            DateTime.now(),
            'Tecnologia',
          ),
          buildCardDeNoticia(
            'Tudo que sabemos sobre o carro voador que será fabricado no Brasil',
            'Descrição da Notícia 2',
            'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
            DateTime.now(),
            'Tecnologia',
          ),
          buildCardDeNoticia(
            '8 coisas muito úteis que você pode fazer sem tocar na tela do seu iPhone',
            'Descrição da Notícia 3',
            'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
            DateTime.now(),
            'Tecnologia',
          ),
        ],
      ),
    );
  }

  Widget buildCardDeNoticia(String titulo, String descricao, String imagemUrl, DateTime data, String categoria) {
    return Container(
      width: 280,
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imagemUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                titulo,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(descricao),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Data: ${data.toLocal()}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Categoria: $categoria'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopAssuntos() {
    return Column(
      children: [
        buildCardDeAssunto('Algoritmos', 'Descrição do Assunto 1'),
        buildCardDeAssunto('Inteligência Artificial', 'Descrição do Assunto 2'),
        buildCardDeAssunto('Internet das Coisas', 'Descrição do Assunto 3'),
      ],
    );
  }

  Widget buildCardDeAssunto(String titulo, String descricao) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(descricao),
          ],
        ),
      ),
    );
  }

  Widget buildNavbar(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Page3(query: ''),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final List<Noticia> noticias = [
    Noticia(
      titulo: 'Novo Smartphone Lançado',
      descricao: 'A empresa X lançou seu mais recente smartphone com recursos incríveis.',
      imagemUrl: 'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
      data: DateTime.now(),
      categoria: 'Tecnologia',
    ),
    Noticia(
      titulo: 'Campeonato de Futebol',
      descricao: 'O time A venceu o time B em uma emocionante partida de futebol.',
      imagemUrl: 'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
      data: DateTime.now(),
      categoria: 'Esportes',
    ),
    Noticia(
      titulo: 'Eleições Municipais',
      descricao: 'Os resultados das eleições municipais foram anunciados hoje.',
      imagemUrl: 'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
      data: DateTime.now(),
      categoria: 'Política',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notícias - Página 2'),
      ),
      body: ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          return buildNoticiaCard(noticias[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _exibirFormularioAdicao(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildNoticiaCard(Noticia noticia) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(noticia.imagemUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                noticia.titulo,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              noticia.titulo,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(noticia.descricao),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Data: ${noticia.data.toLocal()}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categoria: ${noticia.categoria}'),
          ),
        ],
      ),
    );
  }

  void _exibirFormularioAdicao(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController tituloController = TextEditingController();
        final TextEditingController descricaoController = TextEditingController();
        final TextEditingController imagemUrlController = TextEditingController();
        final TextEditingController categoriaController = TextEditingController();

        return AlertDialog(
          title: Text('Adicionar Notícia'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: tituloController,
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              TextField(
                controller: imagemUrlController,
                decoration: InputDecoration(labelText: 'URL da Imagem'),
              ),
              TextField(
                controller: categoriaController,
                decoration: InputDecoration(labelText: 'Categoria'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final noticia = Noticia(
                  titulo: tituloController.text,
                  descricao: descricaoController.text,
                  imagemUrl: imagemUrlController.text,
                  data: DateTime.now(),
                  categoria: categoriaController.text,
                );
                setState(() {
                  noticias.add(noticia);
                });
                Navigator.of(context).pop();
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}

class Noticia {
  final String titulo;
  final String descricao;
  final String imagemUrl;
  final DateTime data;
  final String categoria;

  Noticia({
    required this.titulo,
    required this.descricao,
    required this.imagemUrl,
    required this.data,
    required this.categoria,
  });
}

class Page3 extends StatelessWidget {
  final String query;

  Page3({required this.query});

  @override
  Widget build(BuildContext context) {
    List<Noticia> noticiasTecnologia = [
      Noticia(
        titulo: 'Novo Smartphone Revolucionário Lançado',
        descricao: 'A empresa XYZ lançou um smartphone revolucionário com recursos incríveis.',
        imagemUrl: 'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
        data: DateTime.now(),
        categoria: 'Tecnologia',
      ),
      Noticia(
        titulo: 'Descoberta a cura para o envelhecimento',
        descricao: 'Cientistas anunciam a descoberta de uma cura para o envelhecimento humano.',
        imagemUrl: 'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
        data: DateTime.now(),
        categoria: 'Tecnologia',
      ),
      Noticia(
        titulo: 'Carros autônomos dominam as estradas',
        descricao: 'Carros autônomos agora são uma visão comum nas estradas, tornando a condução mais segura e eficiente.',
        imagemUrl: 'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
        data: DateTime.now(),
        categoria: 'Tecnologia',
      ),
      Noticia(
        titulo: 'Avanço na inteligência artificial',
        descricao: 'Pesquisadores alcançam um avanço significativo na inteligência artificial, abrindo novas possibilidades para aplicações futuras.',
        imagemUrl: 'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
        data: DateTime.now(),
        categoria: 'Tecnologia',
      ),
      Noticia(
        titulo: 'Novos dispositivos vestíveis são lançados',
        descricao: 'Empresas lançam uma nova geração de dispositivos vestíveis que prometem revolucionar o mercado de saúde e fitness.',
        imagemUrl: 'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
        data: DateTime.now(),
        categoria: 'Tecnologia',
      ),
      Noticia(
        titulo: 'Exploração espacial atinge novos patamares',
        descricao: 'A exploração espacial atinge novos patamares com missões tripuladas a Marte e além.',
        imagemUrl: 'https://cdn.w600.comps.canstockphoto.com.br/tecnologia-modernos-trabalhando-homem-banco-de-fotos_csp14325627.jpg',
        data: DateTime.now(),
        categoria: 'Tecnologia',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados da Pesquisa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Resultados da pesquisa para:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              query,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: noticiasTecnologia.length,
                itemBuilder: (context, index) {
                  return buildSearchResultItem(noticiasTecnologia[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchResultItem(Noticia noticia) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        title: Text(noticia.titulo),
        subtitle: Text(noticia.descricao),
        onTap: () {
        },
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
      ),
      body: Center(
        child: Text('Conteúdo da página de Notificações'),
      ),
    );
  }
}

class PersonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Administrador',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Administrador'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '10',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Postagens'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '100',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Seguidores'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '50',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Seguindo'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
