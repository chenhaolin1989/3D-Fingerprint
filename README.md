## Contactless and Partial 3D Fingerprint Recognition using Multi-view Deep Representation 

**[Chenhao Lin](mailto:linchenhao@xjtu.edu.cn), [Ajay Kumar<sup>\*</sup>](mailto:ajay.kumar@polyu.edu.hk)

The Hong Kong Polytechnic University

### Overview of Contactless and Partial 3D Fingerprint
**Contactless and Partial 3D Fingerprint Recognition using Multi-view Deep Representation for matching 3D fingerprints by using multi-view 3D fingerprint deep features.  

The paper has been accepted by Pattern Recognition 2018. For more details, please refer to our [paper](https://www.sciencedirect.com/science/article/pii/S0031320318301687).


## Getting started
#### Requirements
1. Requirements for `Caffe` (see: [Caffe installation instructions](http://caffe.berkeleyvision.org/installation.html))
2. MATLAB

### Files

1. Folder "matlab-train-test-generation" includes the programs for generating the multiview fingerprint images for training and test.
    ---- "full_topview_maskFCN.m" is the program for the generation of original topview fingerprint based on FCN segmentation 
	---- "train_3d_new_full_sideview_mask_partial_shapecode_FCN.m" and "test_3d_new_full_sideview_mask_partial_shapecode_FCN.m" are the programs for 
		  generating original side-view1/2 fingerprint for training and test based FCN segmentation
	---- "train_test_topview_FCN.m" is the program for generating topview fingerprint for training and test based on FCN segmentation 
	---- "sideview_crop_new_mask_shapecode_FCN.m" is the program for cropping sideview1/2 fingerprint for training and test based on FCN segmentation 
	---- "topview_contour_FCN.m" is the program for generating 3d fingerprint contour based on FCN segmentation
	---- "train_test_contour_FCN.m" is the program for generating 3d fingerprint contour for training and test based on FCN segmentation
	---- "gallery_test_img_cnn.m", "mask_partial_surface_generation_gallery.m" and "mask_partial_surface_generation_testing.m" are the programs for 
		  generating partial 3d fingerprint	gallery and testing data
	---- "train_test_3d_vgg_resnet_topview.m", "train_test_3d_vgg_resnet_side.m" and "train_test_3d_partial_resnet_vgg.m" are the programs for generating
		  multi-view 3d fingerprints and partial 3d fingerprints for Resnet and VGG training and test
	----  "FCN" includes the 3d fingerprint segmentation train, test data and results generated using FCN segmentation method

2. Folder "caffe-train-test" includes caffe program, training and test files in this work.
	---- this folder includes the training prototxts for 3d fingerprint and partial 3d fingerprint recognition using polyu dataset


## Citation
```
@article{lin2018contactless,
  title={Contactless and partial 3D fingerprint recognition using multi-view deep representation},
  author={Lin, Chenhao and Kumar, Ajay},
  journal={Pattern Recognition},
  volume={83},
  pages={314--327},
  year={2018},
  publisher={Elsevier}
}
```


### License

```
Copyright (c) 2018-present The Hong Kong Polytechnic University.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
