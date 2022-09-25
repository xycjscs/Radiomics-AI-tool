# Radiomics-AI-tool

1.获取基线CECT的图像数据，一般为dicom格式
2.手工进行肿瘤分割，一般用itk-snap、3D slicer等软件，获得nrrd或者nifti等格式的ROI文件
3.将CECT和ROI文件通过pyradiomics免费开源软件(特征用version xxx)，应用supplements 中提供的代码获得需要的radiomics features,运行supplements python代码获得DL features
4.根据supplements 中提供的公式或者excel文件1计算得到DLR score
5.将DLR score和需要的临床病理数据代入公式或通过excel文件2获得1.3.5年RFS的可能性，或者通过中manuscript 提供的接线图获得
