import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moviespot/bloc/get_persons_bloc.dart';
import 'package:moviespot/models/person.dart';
import 'package:moviespot/models/person_response.dart';
import 'package:moviespot/style/theme.dart' as Style;

class PersonWidget extends StatefulWidget {
  @override
  _PersonWidgetState createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  PersonsListBloc personBloc = PersonsListBloc();

  @override
  void initState() {
    personBloc.getPersons();
    super.initState();
  }

  @override
  void dispose() {
    personBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, top: 20),
          child: Text("TOP TRENDING PERSONS OF THE WEEK",
              style: TextStyle(
                  fontSize: 12.5,
                  color: Style.Colors.titleColor,
                  fontWeight: FontWeight.w500)),
        ),
        SizedBox(
          height: 5,
        ),
        StreamBuilder<PersonResponse>(
          stream: personBloc.subject.stream,
          builder: (context, AsyncSnapshot<PersonResponse> snapshot) {
            if (snapshot.hasData) {
              return _buildPersonWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        )
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 5,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("Error occured $error")],
      ),
    );
  }

  Widget _buildPersonWidget(PersonResponse data) {
    List<Person> persons = data.persons;
    return Container(
      height: 135,
      padding: EdgeInsets.only(left: 0),
      child: ListView.builder(
        itemCount: persons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            padding: EdgeInsets.only(left: 7, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                persons[index].profilePath.isNotEmpty
                    ? Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w200/" +
                                        persons[index].profilePath),
                                fit: BoxFit.cover)),
                      )
                    : Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child:
                            Icon(FontAwesomeIcons.userAlt, color: Colors.white),
                      ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  persons[index].name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      height: 1.4,
                      fontSize: 9,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Trending For ${persons[index].knownForDepartment}",
                  style: TextStyle(
                      color: Style.Colors.titleColor,
                      fontSize: 7,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
