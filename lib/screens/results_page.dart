import '../constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import 'package:bmi_calc/components/bottom_button.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class ResultsPage extends StatelessWidget {

  const ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    double bmi = double.tryParse(bmiResult) ?? 0.0;
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text("Your Result", style: kTitleStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: kresultTextStyle, textAlign: TextAlign.center,),
                  // BMI Gauge
                  SizedBox(
                    height: 220,
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 10,
                          maximum: 40,
                          interval: 5,
                          showLabels: true,
                          showTicks: true,
                          axisLineStyle: AxisLineStyle(thickness: 0.15, thicknessUnit: GaugeSizeUnit.factor),
                          ranges: <GaugeRange>[
                            GaugeRange(startValue: 10, endValue: 18.5, gradient: SweepGradient(colors: [Colors.lightBlueAccent, Colors.blue]),
                              label: 'Underweight',
                              sizeUnit: GaugeSizeUnit.factor,
                              startWidth: 0.15,
                              endWidth: 0.15,),
                            GaugeRange(startValue: 18.5, endValue: 24.9,gradient: SweepGradient(colors: [Colors.lightGreenAccent, Colors.green]),
                              label: 'Normal',
                              startWidth: 0.15,
                              endWidth: 0.15,
                              sizeUnit: GaugeSizeUnit.factor,),
                            GaugeRange(startValue: 24.9, endValue: 30,gradient: SweepGradient(colors: [Colors.orangeAccent, Colors.deepOrange]),
                              label: 'Overweight',
                              startWidth: 0.15,
                              endWidth: 0.15,
                              sizeUnit: GaugeSizeUnit.factor,),
                            GaugeRange(startValue: 30, endValue: 40, gradient: SweepGradient(colors: [Colors.redAccent, Colors.red]),
                              label: 'Obese',
                              startWidth: 0.15,
                              endWidth: 0.15,
                              sizeUnit: GaugeSizeUnit.factor,),
                          ],
                          pointers: <GaugePointer>[
                            NeedlePointer(
                              value: bmi,
                              enableAnimation: true,
                              animationType: AnimationType.easeOutBack,
                              needleColor: Colors.white,
                              knobStyle: KnobStyle(color: Colors.white),
                            )
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              widget: Text(
                                bmiResult,
                                style: kBMITextStyle.copyWith(fontSize: 60.0),
                              ),
                              angle: 90,
                              positionFactor: 1.2,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'RECALCULATE', onTap: () {
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}
