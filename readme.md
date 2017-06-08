## Synopsis

Neural style painter is a Processing application that allows user to upload their picture and apply one of the 6 styles available. The styles can be applied to the entire picture, or painted on parts of the picture with paintbrushes.


## Installation

The neural styles use python and tensorflow library. In order to run the code python 3.5 must be installed on the system. Tensorflow can be installed according to the installation instructions on [tensorflow](https://www.tensorflow.org/install/) web site.

To run the application install [processing](https://processing.org/) and run the GUI.pde file.

## Application
<img src = '/GUI.jpg' height = '400px'>

As the application is run, the user chooses the picture to upload and style. After the picture is chosen the neural network applies the styles to it and opens the graphical user interface (see picture. The icons on the right show the preview of the stylized picture.

When a style is chosen the user can choose the size of the paintbrush to apply the style on the picture. The scale next to the brushes is used to adjust the transparency of the applied style. The chosen style cn be applied to the entire picture by double-clicking the style icon.

Once the styles have been applied the picture can be saved as a .jpg 


## Credits

The neural styles are trained on the fast style transfer by [Logan Engstorm](https://github.com/lengstrom/fast-style-transfer). 

## License

Copyright fast style transfer (c) 2016 Logan Engstrom. Contact me for commercial use (email: engstrom at my university's domain dot edu). Free for research/noncommercial use, as long as proper attribution is given and this copyright notice is retained.

