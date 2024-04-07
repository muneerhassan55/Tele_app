import 'package:flutter/material.dart';
import 'package:tele_app/src/pages/call_page.dart';
import 'package:tele_app/src/theme/light_color.dart';
import 'package:tele_app/src/model/dactor_model.dart';
import 'package:tele_app/src/theme/text_styles.dart';
import 'package:tele_app/src/theme/theme.dart';
import 'package:tele_app/src/theme/extention.dart';
import 'package:tele_app/src/widgets/progress_widget.dart';
import 'package:tele_app/src/widgets/rating_start.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.model}) : super(key: key);
  final DoctorModel model;

  @override
  // ignore: library_private_types_in_public_api
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DoctorModel model;

  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  Widget _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(color: Theme.of(context).primaryColor),
        IconButton(
          icon: Icon(
            model.isfavourite ? Icons.favorite : Icons.favorite_border,
            color: model.isfavourite ? Colors.red : LightColor.grey,
          ),
          onPressed: () {
            setState(() {
              model.isfavourite = !model.isfavourite;
            });
          },
        ),
      ],
    );
  }

  Widget _doctorDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                model.name,
                style: TextStyles.title.copyWith(fontSize: 25).bold,
              ),
              const SizedBox(width: 10),
              Icon(Icons.check_circle,
                  size: 18, color: Theme.of(context).primaryColor),
              const Spacer(),
              RatingStar(rating: model.rating, key: ValueKey(model.rating)),
            ],
          ),
          subtitle: Text(
            model.type,
            style: TextStyles.bodySm.subTitleColor.bold,
          ),
        ),
        const Divider(
          thickness: .3,
          color: LightColor.grey,
        ),
        Row(
          children: <Widget>[
            ProgressWidget(
              value: model.goodReviews,
              totalValue: 100,
              activeColor: LightColor.purpleExtraLight,
              backgroundColor: LightColor.grey.withOpacity(.3),
              title: "Good Review",
              durationTime: 500,
              key: const Key("goodReviewsKey"),
            ),
            ProgressWidget(
              value: model.totalScore,
              totalValue: 100,
              activeColor: LightColor.purpleLight,
              backgroundColor: LightColor.grey.withOpacity(.3),
              title: "Total Score",
              durationTime: 300,
              key: const Key("totalScoreKey"),
            ),
            ProgressWidget(
              value: model.satisfaction,
              totalValue: 100,
              activeColor: LightColor.purple,
              backgroundColor: LightColor.grey.withOpacity(.3),
              title: "Satisfaction",
              durationTime: 800,
              key: const Key("SatisfactionKey"),
            ),
          ],
        ),
        const Divider(
          thickness: .3,
          color: LightColor.grey,
        ),
        Text("About", style: TextStyles.title.copyWith(fontSize: 25).bold).vP16,
        Text(
          model.description,
          style: TextStyles.body.subTitleColor,
        ),
      ],
    );
  }

  Widget _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _actionButton(Icons.call, "Call", () {
          //   Navigator.push(
          // context,
          // MaterialPageRoute(builder: (context) => CallPage()),
          //);
        }),
        const SizedBox(width: 10),
        _actionButton(Icons.chat_bubble, "Chat", () {}),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/appointment');
          },
          child:
              Text("Make an appointment", style: TextStyles.titleNormal.white)
                  .p(10),
        ),
      ],
    ).vP16;
  }

  Widget _actionButton(IconData icon, String label, VoidCallback onPressed) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: LightColor.grey.withAlpha(150),
      ),
      child: Icon(icon, color: Colors.white),
    ).ripple(onPressed, borderRadius: BorderRadius.circular(10), text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.extraLightBlue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Image.asset(model.image),
            DraggableScrollableSheet(
              maxChildSize: .8,
              initialChildSize: .6,
              minChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  height: AppTheme.fullHeight(context) * .5,
                  padding: const EdgeInsets.only(left: 19, right: 19, top: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _doctorDetails(),
                        _actionButtons(),
                      ],
                    ),
                  ),
                );
              },
            ),
            _appBar(),
          ],
        ),
      ),
    );
  }
}
