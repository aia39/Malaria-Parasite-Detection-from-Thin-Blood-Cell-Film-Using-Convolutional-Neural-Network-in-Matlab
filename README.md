# Malaria-Parasite-Detection-from-Thin-Blood-Cell-Film-Using-Convolutional-Neural-Network-using-Matlab

Widely used matlab is also another option to apply deep learning framework besides python. So Malaria parasite detection from thin blood cell film by CNN is implemented using matlab. This is basically a binary classification task where two classes are Parasitized or Uninfected.


# Dataset 
Dataset of thin blood cell film can be downloaded from [NIH](https://lhncbc.nlm.nih.gov/publication/pub9932) website or [Kaggle](https://www.kaggle.com/iarunava/cell-images-for-detecting-malaria)

After downloading dataset it should be organized like 

cell_images\
|
|
---train\
        |
        |
        --Parasitized\
            * .jpg
            ..
        --Uninfected\
            * .jpg
            ..
---valid\
        |
        |
        --Parasitized\
            * .jpg
            ..
        --Uninfected\
            * .jpg
            ..

# Getting Started 

**Step 1:** 
	Clone the repository. 
  
**Step 2:**
	Open file 'Train.m' to train the binary classifier. 
  Weight will be saved after each epoch. Each weight will be saved in 'Saved Model Checkpoint' folder. So firstly you have to make a   folder named 'Saved Model Checkpoint'.
	
**Step 3:**
	Open file 'Test' to evaluate trained classifier. A confusion matrix will be saved in master directory.
