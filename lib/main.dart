import'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: MyForms());
  }
}
class MyForms extends StatefulWidget {
  const MyForms({super.key});
  @override
  State<MyForms> createState() => _MyFormsState();
}
class _MyFormsState extends State<MyForms> {
  final _formkey=GlobalKey<FormState>();
  final _email=TextEditingController();
  final _pass=TextEditingController();
  bool? _ischecked=false;
  bool pass_validity=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ PopupMenuButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          position: PopupMenuPosition.values[1],
          splashRadius: 30,
          itemBuilder: (context)=>[PopupMenuItem(child: Text("Settings"),
          )],
        ),
        ],
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5A1tYwFQCZxthWmFs5eJdOfpzjeCt-z7yZdrq0TvV68URyKx8m5Y3VLU0LBMT9hqkYb4&usqp=CAU"),
                  width: 200,
                  height: 200),
              SizedBox(
                height: 10,
              ),
              Center(child: Text("Welcome",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600),),),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    hintText: "*****",
                    //helperText: "******@gmail.com",
                    helperStyle: TextStyle(color: Colors.black),
                    labelText: "Email address",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: _email,
                  validator: (val)=>val!.length==0 ? "Enter email address": null,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        pass_validity=!pass_validity;
                      });
                    },
                        icon: Icon(Icons.remove_red_eye_outlined,color: Colors.black,)),
                    hintText: "*****",
                    helperStyle: TextStyle(color: Colors.black),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    //icon: Icon(Icons.email)
                  ),
                  maxLength: 10,
                  controller: _pass,
                  obscureText: true,
                  validator: (val)=>val!.isEmpty ? "Enter password":null,
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CheckboxMenuButton(value: _ischecked, onChanged:(val) {
                  setState(() {
                    _ischecked=val;
                  });
                },child: Text("Save the credentials"),
                 // trailingIcon: Icon(Icons.save),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(child:TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>password()));
              }, child: Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.w600),))),
              SizedBox(height: 5,),
              ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate()) {
                  print("true!!!!!!!!!!");
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => next()));
                }
              },
                child: Text("Login"),
              ),
              SizedBox(height: 5,),
              Center(child: Text("If you don't have account! then",style: TextStyle(color: Colors.blue),),),
              SizedBox(height: 5,),
              Center(child: TextButton(onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>create()));
              }, child: Text("Create Account!",style: TextStyle(fontWeight:FontWeight.w600),)))
            ],
          ),
        ),
      ),
    );
  }
}
class next extends StatefulWidget {
  const next({super.key});
  @override
  State<next> createState() => _nextState();
}
class _nextState extends State<next> {
  double currentSliderValue=10;
  double slider=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.blue,
      title: Text('Tables for Children'),
    ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Slider(
            divisions: 100,
            min: 1,
            max: 100,

            activeColor: Colors.blue,
            inactiveColor: Colors.black,
            value: slider,onChanged: (val){
            setState(() {
              slider=val;
              print(slider.toInt());
            });
          },
          ),
          Text('${slider.toInt()}', style: TextStyle(fontSize: 100,fontWeight: FontWeight.normal,color: Colors.black38),),
        ],
      ),
    );
  }
}
class create extends StatefulWidget {
  const create({super.key});

  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(appBar: AppBar(),
      body: SingleChildScrollView(scrollDirection:Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                    hintText: "id num.",labelText: "username",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red)),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(onPressed: () {}, icon:Icon(Icons.arrow_drop_down_outlined))),
                cursorColor: Colors.black,
                cursorHeight:20,
                cursorWidth: 3,
                cursorRadius: Radius.circular(10),
                obscureText: false,
              ),

              SizedBox(height: 10),
              TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.date_range_outlined),
                  suffixIcon: Icon(Icons.arrow_drop_down_circle_outlined),
                  labelText: "DOB",hintText: "dd/mm/year"

              ),
                cursorHeight: 20,
                cursorWidth: 2,
                cursorRadius: Radius.circular(10),
              ),


              SizedBox(height: 10,),
              TextField(decoration: InputDecoration(
                  labelText: "password",hintText: "security",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.password_outlined),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined )
              ),
                obscureText: true,
                //obscuringCharacter: 'R',
                cursorRadius: Radius.circular(10),
                cursorWidth: 2,
                cursorHeight: 20,

              ),
              SizedBox(height: 10,),
              TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.phone),
                  labelText: "Phone",hintText: "Number"

              ),
                cursorRadius: Radius.circular(10),
                cursorWidth: 2,
                cursorHeight: 20,
              ),
              SizedBox(height: 10,),
              TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.person),
                  labelText: "Gender",
                  hintText: "Male/Female"
              ),cursorHeight: 20,
                cursorWidth: 2,
                cursorRadius: Radius.circular(10),
              ),
              SizedBox(height: 50),
              ElevatedButton(onPressed: () {},
                  child: Text("Create")),
            ],),
        ),
      ),
    );
  }
}
class password extends StatefulWidget {
  const password({super.key});

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          children: [
            SizedBox(height: 200,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  hintText: "*****",
                  suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye_outlined,color: Colors.black,)),
                  helperStyle: TextStyle(color: Colors.black),
                  labelText: "New Password",
                  labelStyle: TextStyle(color: Colors.black),
                ),
                maxLength: 10,
                validator: (val)=>val!.length==0 ? "Enter email address": null,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  // prefixIcon: Icon(Icons.password,
                  //   color: Colors.blue,
                  // ),
                  suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye_outlined,color: Colors.black,)),
                  //suffixText: "hide",
                  hintText: "*****",
                  //helperText: "Forgot Password!",
                  helperStyle: TextStyle(color: Colors.black),
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(color: Colors.black),
                  //icon: Icon(Icons.email)
                ),
                maxLength: 10,
                obscureText: true,
                validator: (val)=>val!.isEmpty ? "Enter password":null,
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Reset"))
          ]
      ),
    );
  }
}