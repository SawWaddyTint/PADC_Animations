import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padc_animations/implicit_animations/explicit_animation_favourite_button.dart';

const kAnimationDuration = const Duration(milliseconds: 500);
const kAnimationDurationForSecondFadeIn = const Duration(milliseconds: 1000);

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  _ImplicitAnimationsState createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool isNewDimensions = false;
  bool isDescriptionShown = true;
  bool isChangeBackgroundColor = false;
  bool isChangeButtonLayout = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TweenAnimationBuilder(
            child: AnimatedContainer(
              duration: kAnimationDuration,
              color: (isChangeBackgroundColor) ? Colors.black : Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 70.0,
                    ),
                    Stack(
                      children: [
                        AnimatedContainer(
                          width: (isNewDimensions) ? 300 : 200,
                          height: (isNewDimensions) ? 250 : 150,
                          duration: kAnimationDuration,
                          curve: Curves.easeInCubic,
                          child: Image.asset("lib/assets/bird_image.png",
                              fit: BoxFit.contain),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          // left: 180.0,
                          child: ExplicitAnimationFavouriteIconButton(),
                        ),
                      ],
                    ),
                    AnimatedSize(
                      duration: kAnimationDuration,
                      child: Container(
                        height: isDescriptionShown ? null : 0.0,
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "Birds are vertebrate animals that have feathers, wings, and beaks. Like all vertebrates, they have bony skeleton.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: isChangeBackgroundColor
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    AnimatedSize(
                      duration: kAnimationDuration,
                      child: AnimatedSwitcher(
                        duration: kAnimationDuration,
                        child: (isChangeButtonLayout)
                            ? PrimaryButtonsInWrap(
                                onTapChangeDimension: () {
                                  setState(
                                    () {
                                      isNewDimensions = !isNewDimensions;
                                    },
                                  );
                                },
                                onTapHideOrShowDescription: () {
                                  setState(
                                    () {
                                      isDescriptionShown = !isDescriptionShown;
                                    },
                                  );
                                },
                                onTapChangeTheme: () {
                                  setState(
                                    () {
                                      isChangeBackgroundColor =
                                          !isChangeBackgroundColor;
                                    },
                                  );
                                },
                                isDescriptionShown: isDescriptionShown)
                            : PrimaryButtonsInColumn(
                                onTapChangeDimension: () {
                                  setState(
                                    () {
                                      isNewDimensions = !isNewDimensions;
                                    },
                                  );
                                },
                                onTapHideOrShowDescription: () {
                                  setState(
                                    () {
                                      isDescriptionShown = !isDescriptionShown;
                                    },
                                  );
                                },
                                onTapChangeTheme: () {
                                  setState(
                                    () {
                                      isChangeBackgroundColor =
                                          !isChangeBackgroundColor;
                                    },
                                  );
                                },
                                isDescriptionShown: isDescriptionShown),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    PrimaryButton(
                        onTap: () {
                          setState(() {
                            isChangeButtonLayout = !isChangeButtonLayout;
                          });
                        },
                        label: "Change Button Layout",
                        color: Colors.redAccent)
                  ],
                ),
              ),
            ),
            duration: kAnimationDurationForSecondFadeIn,
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double _opacity, child) => Opacity(
              opacity: _opacity,
              child: child,
            ),
          ),

          TweenAnimationBuilder(
            child: Text(
              "PADC Animations",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (isChangeBackgroundColor) ? Colors.white : Colors.black,
                fontSize: 20,
              ),
            ),
            tween: Tween<double>(begin: 0, end: 1),
            duration: kAnimationDurationForSecondFadeIn,
            builder: (context, double _value, child) => Opacity(
              opacity: _value,
              child: Padding(
                padding: EdgeInsets.only(top: _value * 50, left: 16),
                // padding: EdgeInsets.only(top: 12),
                child: child,
              ),
            ),
          )
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   child: ExplicitAnimationFavouriteIconButton(),
          // ),
        ],
      ),
    );
  }
}

class PrimaryButtonsInColumn extends StatelessWidget {
  final Function onTapChangeDimension;
  final Function onTapHideOrShowDescription;
  final Function onTapChangeTheme;
  final bool isDescriptionShown;
  PrimaryButtonsInColumn({
    Key? key,
    required this.onTapChangeDimension,
    required this.onTapHideOrShowDescription,
    required this.onTapChangeTheme,
    required this.isDescriptionShown,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          onTap: onTapChangeDimension,
          label: "Change Dimensions",
        ),
        PrimaryButton(
          onTap: onTapHideOrShowDescription,
          label: isDescriptionShown ? "Hide Description" : "ShowDescription",
        ),
        PrimaryButton(
          onTap: onTapChangeTheme,
          label: "Change Theme",
        ),
      ],
    );
  }
}

class PrimaryButtonsInWrap extends StatelessWidget {
  final Function onTapChangeDimension;
  final Function onTapHideOrShowDescription;
  final Function onTapChangeTheme;
  final bool isDescriptionShown;
  PrimaryButtonsInWrap({
    Key? key,
    required this.onTapChangeDimension,
    required this.onTapHideOrShowDescription,
    required this.onTapChangeTheme,
    required this.isDescriptionShown,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      children: [
        PrimaryButton(
          onTap: onTapChangeDimension,
          label: "Change Dimensions",
        ),
        PrimaryButton(
          onTap: onTapHideOrShowDescription,
          label: isDescriptionShown ? "Hide Description" : "Show Description",
        ),
        PrimaryButton(
          onTap: onTapChangeTheme,
          label: "Change Theme",
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final Color color;
  PrimaryButton(
      {Key? key,
      required this.onTap,
      required this.label,
      this.color = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onTap(),
      child: Text(label),
      textColor: Colors.white,
      color: color,
    );
  }
}
