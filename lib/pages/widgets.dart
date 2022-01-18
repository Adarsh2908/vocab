import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'word_details.dart';

class widgets  {
  myColors mc = myColors();

  Text Header()
  {
    return Text("V O C A B",
      style: GoogleFonts.montserrat(
          fontSize: 24.0,
          letterSpacing: 3.0
      ),);
  }

  Text footer()
  {
    return Text('Copyright © CHASE DREAMS 2022',
      style: GoogleFonts.montserrat(
          fontSize: 10.0,
          color: mc.greyText,
          letterSpacing: 2.0,
          fontWeight: FontWeight.w300
      ),
    );
  }

  // Image Getter
  putImage(String name, double ht , double wd)
  {
    return Container(
      child: Image.asset('assets/$name'),
      height: ht,
      width: wd,
    );
  }

  // Input Decoration
  inputDecoration(final String labelText, Icon ic)
  {
    return InputDecoration(
        labelText: labelText,
        fillColor: mc.lightGrey,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.0)),
        prefixIcon: ic,
        labelStyle: GoogleFonts.montserrat(
            fontSize: 12.0,
            color: mc.white,
            letterSpacing: 2.0),
        filled: true
    );
  }

  // Text Putter
  Text putText(final String text,final double textSize , final double spacing, Color textColor)
  {
    return Text(text,
      style: GoogleFonts.montserrat(
          fontSize: textSize,
          color: textColor,
          letterSpacing: spacing,
          fontWeight: FontWeight.w300,

      ),
    );
  }

// Elevated Button Style
elevatedButtonStyle(final Color btnColor, final double length , final double height)
{
  return ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(10.0),
      primary: btnColor,
      fixedSize: Size(length, height));
}
homePageCard(final String header , final String footer , final String daysCount,Color boxColor,Color midText)
{
  return Container(
    height: 140,
    width: 160,
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(15.0)
    ),
    child: Center(
      child: Column(
        children: [
          SizedBox(height: 15.0,),
          // Header
          putText(header, 13.0, 2.0,mc.greyText),
          SizedBox(height: 15.0,),
          // Header
          putText(daysCount, 40.0, 2.0,midText),
          SizedBox(height: 14.0,),
          // Header
          putText(footer, 12.0, 2.0,mc.greyText),
        ],
      ),
    ),
  );
}

// Word Card

wordCard(final String word , final String translatedWord , final String meaning, final int index, final double width, BuildContext context)
{
  return Container(
    width: width,
    height: 140,
    decoration: BoxDecoration(
      color: (index.isEven) ? Colors.orange.withOpacity(0.6):Colors.deepPurpleAccent.withOpacity(0.5),
      borderRadius: BorderRadius.circular(8.0)
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15.0,12.0,12.0,3.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Words , icon and Traslated
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              putText(word, 18.0, 3.0, mc.greyText),
              Icon(Icons.double_arrow_outlined,color: mc.white,),
              putText(translatedWord, 18.0, 3.0, mc.greyText),
            ],
          ),
          const SizedBox(height: 15.0,),
          putText(meaning, 12.0, 1.0, mc.white),
          const SizedBox(height: 15.0,),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: elevatedButtonStyle(mc.primaryBlue, 80.0, 20.0),
                onPressed: () => {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Saved to Favorites."),backgroundColor: Colors.deepPurple,)),
                },
                child:Text("SAVE",
                    style: GoogleFonts.montserrat(
                        letterSpacing: 1.0,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500)),
              ),
              // Favorite
              ElevatedButton(
                style: elevatedButtonStyle(mc.Green, 80.0, 20.0),
                onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  WordDetails(word:word)),
                        )
                },
                child:Text("DETAILS",
                    style: GoogleFonts.montserrat(
                        letterSpacing: 1.0,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500)),
              ),
              // Report Error
              ElevatedButton(
                style: elevatedButtonStyle(mc.Red, 120.0, 20.0),
                onPressed: () => {
                      // Showing User a SnackBar that Report is Send
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Reported Successfully."),backgroundColor: Colors.green,)),

                },
                child:Text("REPORT ERROR",
                    style: GoogleFonts.montserrat(
                        letterSpacing: 1.0,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// WordCardSaved
  wordCardSaved(final String word , final String translatedWord , final String meaning, final int index, final double width, BuildContext context)
  {
    return Container(
      width: width,
      height: 140,
      decoration: BoxDecoration(
          color: (index.isEven) ? Colors.orange.withOpacity(0.6):Colors.deepPurpleAccent.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0,12.0,12.0,3.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Words , icon and Traslated
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                putText(word, 18.0, 3.0, mc.greyText),
                Icon(Icons.double_arrow_outlined,color: mc.white,),
                putText(translatedWord, 18.0, 3.0, mc.greyText),
              ],
            ),
            const SizedBox(height: 15.0,),
            putText(meaning, 12.0, 1.0, mc.white),
            const SizedBox(height: 15.0,),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Word Details
                ElevatedButton(
                  style: elevatedButtonStyle(mc.Green, 80.0, 20.0),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  WordDetails(word:word)),
                    )
                  },
                  child:Text("DETAILS",
                      style: GoogleFonts.montserrat(
                          letterSpacing: 1.0,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500)),
                ),
                // Remove
                ElevatedButton(
                  style: elevatedButtonStyle(mc.Red, 120.0, 20.0),
                  onPressed: () => {
                    // Showing User a SnackBar that Report is Send
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Reported Successfully."),backgroundColor: Colors.green,)),

                  },
                  child:Text("REMOVE WORD",
                      style: GoogleFonts.montserrat(
                          letterSpacing: 1.0,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}