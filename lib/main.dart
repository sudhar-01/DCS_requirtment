import 'package:dcs_project/Network.dart';
import 'package:dcs_project/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (_) => ChangeTheme(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChangeTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: provider.theme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future data;
  String url =
      "https://script.googleusercontent.com/macros/echo?user_content_key=xb7gYdo8sSb4hsV835Fp-iZNZz3YlMjZ0eL_GczYMNBND6jcgMVlOxhTMAYDWbQE1gc3duVuAiCcFY0ePE3MTU4CFf4Tbaaqm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnNsHSMmXq-k19dE_DvThJzPMEitbPb3SU5l_i-3w9HqS8Yk8yFriOPf-ulbe1QHFr7iVd_ROl7oFYnNXdHswZmeeGiwEmyZ7adz9Jw9Md8uu&lib=MCQ7-PCgFr0rDVI60wR8OAyqytt5QPohG";
  @override
  void initState() {
    super.initState();
    data = Network(url).getData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChangeTheme>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("I ",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15,fontWeight: FontWeight.bold,fontStyle:FontStyle.italic),),
            Icon(Icons.favorite,size: 15,color: Colors.red,),
            Text(" DCS",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15,fontWeight: FontWeight.bold,fontStyle:FontStyle.italic),),
          ],
        ),
      ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          actions: [
            InkWell(
              onTap: () {
                provider.changeTheme();
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset(
                  "assets/Light Bulb.png",
                  color: Theme.of(context).primaryColorLight,
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
        body: Container(
          height: height,
          width: width,
          color: Theme.of(context).backgroundColor,
          child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<dynamic> snapshot) => snapshot
                      .hasData
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: width * 0.3,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            "assets/Profile Picture.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 18.0, 8.0, 0.0),
                          child: Text(
                            snapshot.data["name"]!,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                          child: Text(
                            snapshot.data["position"]!,
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColorLight),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: width * 0.8,
                              child: Text(
                                snapshot.data["description"]!,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColor),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              launchUrl(
                                  "mailto:${snapshot.data["email"]!}", context);
                            },
                            child: Container(
                              width: width * 0.7,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: 2.0,
                                        blurRadius: 1.0,
                                        offset: Offset(2, 2))
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Theme.of(context).primaryColorLight),
                              child: Center(
                                child: Text(
                                  snapshot.data["email"]!,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: height * 0.07,
                            width: width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                        snapshot.data["socials"]["twitter"]!,
                                        context);
                                  },
                                  child: SizedBox(
                                    child: Image.asset("assets/Twitter.png",
                                        color: Theme.of(context)
                                            .primaryColorLight),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                        snapshot.data["socials"]["instagram"]!,
                                        context);
                                  },
                                  child: SizedBox(
                                    child: Image.asset(
                                      "assets/Instagram.png",
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                        snapshot.data["socials"]["dribbble"]!,
                                        context);
                                  },
                                  child: SizedBox(
                                    child: Image.asset(
                                      "assets/Dribbble.png",
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                        snapshot.data["socials"]["linkedin"]!,
                                        context);
                                  },
                                  child: SizedBox(
                                    child: Image.asset(
                                      "assets/LinkedIn.png",
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                        snapshot.data["socials"]["github"]!,
                                        context);
                                  },
                                  child: SizedBox(
                                    child: Image.asset("assets/Github.png",
                                        color: Theme.of(context)
                                            .primaryColorLight),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                        snapshot.data["socials"]
                                            ["devCommunity"]!,
                                        context);
                                  },
                                  child: SizedBox(
                                    child: Image.asset(
                                      "assets/Dev.png",
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  : const Center(child: CircularProgressIndicator())),
        ));
  }
}
