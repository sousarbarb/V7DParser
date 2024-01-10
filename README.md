# V7DParser

This repository has all the Gerber files and respective images used in the scope
of the work _Gerber File Parsing for Conversion to Bitmap Image - The VINCI7D
Case Study_. The rendered images were obtained using the following softwares /
libraries:

- V7DParser: a parser of Gerber files to bitmap images developed by
  [CRIIS - Centre for Robotics in Industry and Intelligent Systems](https://www.inesctec.pt/en/centres/criis)
  from
  [INESC TEC - Institute for Systems and Computer Engineering, Technology and Science](https://www.inesctec.pt/en)
  in the context of VINCI7D
  ([link 1](https://www.centi.pt/index.php/en/projects/automotive-aeronautics/vinci-7d-en),
  [link 2](https://elibrary.vdi-verlag.de/10.51202/2366-8040-2021-36-012/highly-flexible-displays-for-automotive-interior-applications-volume-11-2021-issue-36?page=1)) project
- [GerbView](https://www.gerbview.com/)
- [GerbLib](https://www.bronzware.com/GerbMagic/gerblib.htm)
- [Reference Gerber Viewer](https://www.ucamco.com/en/gerber/reference-gerber-viewer)
  (ground-truth data)

## Renderization examples

### Accuracy evaluation (image renderization)

- Aperture Blocks
  ([gbr](gbr/evaluation/accuracy/aperture-blocks.gbr),
  [render](render/evaluation/accuracy/aperture-blocks/)):
  `aperture-blocks_<V7DParser|GerbView|GerbLib>_<resolution>mm_px`
- Front layer of a PCB
  ([gbr](gbr/evaluation/accuracy/pcb-front.gbr),
  [render](render/evaluation/accuracy/pcb-front/)):
  `pcb-front_<V7DParser|GerbView|GerbLib>_<resolution>mm_px`
- Back layer of a PCB
  ([gbr](gbr/evaluation/accuracy/pcb-back.gbr),
  [render](render/evaluation/accuracy/pcb-back/)):
  `pcb-back_<V7DParser|GerbView|GerbLib>_<resolution>mm_px`

### Performance evaluation (execution time - us)

- Dynamic size
  ([gbr](gbr/evaluation/performance/),
  [render](render/evaluation/performance/):
  `dynamic-<01-40>_<GerbLib|V7DParser>_<resolution>`)
- Static size
  ([gbr](gbr/evaluation/performance/),
  [render](render/evaluation/performance/):
  `static-<01-40>_<GerbLib|V7DParser>_<resolution>`)

### Gerber standard commands

- Standard Apertures (C/O/P/R)
  ([gbr](gbr/gerber/),
  [render](render/gerber/)):
  `standard-apertures_<c|o|p|r>`
- Aperture Block (AB)
  ([gbr](gbr/gerber/aperture-blocks.gbr),
  [render](render/gerber/aperture-blocks.png))
- Aperture Macro (AM)
  ([gbr](gbr/gerber/),
  [render](render/gerber/)):
  `aperture-macro_<1-circle|4-outline|5-polygon|6-moire|7-thermal|20-vector-line|21-center-line>`
- Region Statement (G36/G37)
  ([gbr](gbr/gerber/region-statement.gbr),
  [render](render/gerber/region-statement.jpg))
- Step & Repeat (SR)
  ([gbr](gbr/gerber/step-repeat.gbr),
  [render](render/gerber/step-repeat.jpg))

## License

Distributed under the [MIT License](https://choosealicense.com/licenses/mit/).
See [`LICENSE`](LICENSE) for more information.

## Contacts

If you have any questions or you want to know more about the work developed by
us, please contact one of the contributors of this project:

- Ricardo B. Sousa ([email:feup](mailto:up201503004@edu.fe.up.pt),
  [email:inesctec](mailto:ricardo.b.sousa@inesctec.pt),
  [orcid](https://orcid.org/0000-0003-4537-5095))
  _(corresponding author)_
- Cláudia Daniela Rocha ([email](mailto:claudia.d.rocha@inesctec.pt),
  [orcid](https://orcid.org/0000-0001-7254-0346))
- Hélio S. Mendonça ([email](mailto:hsm@fe.up.pt),
  [orcid](https://orcid.org/0000-0003-4895-5634))
- António Paulo Moreira ([email](mailto:amoreira@fe.up.pt),
  [orcid](https://orcid.org/0000-0001-8573-3147))
- Manuel F. Silva ([email](mailto:mss@isep.ipp.pt),
  [orcid](https://orcid.org/0000-0002-0593-2865))

## References

R. B. Sousa, C. Rocha, H. S. Mendonça, A. P. Moreira and M. F. Silva.
_Gerber File Parsing for Conversion to Bitmap Image–The VINCI7D Case Study_.
IEEE Access, vol. 10, pp. 69659-69679, 2022.
DOI: [10.1109/ACCESS.2022.3187042](https://doi.org/10.1109/ACCESS.2022.3187042)

## Acknowledgements

- [CRIIS - Centre for Robotics in Industry and Intelligent Systems](https://www.inesctec.pt/en/centres/criis)
  from
  [INESC TEC - Institute for Systems and Computer Engineering, Technology and Science](https://www.inesctec.pt/en)
- [Faculty of Engineering, University of Porto (FEUP)](https://sigarra.up.pt/feup/en/WEB_PAGE.INICIAL)
- [ISEP - School of Engineering of the Porto Polytechnic](https://www.isep.ipp.pt/)
- [Rui Azevedo - Soluções de Acabamentos e Tampografia](https://www.ruiazevedo.pt/)

## Funding

This work is financed by National Funds through the Portuguese funding agency,
[FCT - Fundação para a Ciência e a Tecnologia](https://www.fct.pt/index.phtml.en),
within project UIDB/50014/2020. Also, we thank
[Rui Azevedo - Soluções de Acabamentos e Tampografia](https://www.ruiazevedo.pt/)
in the scope of the VINCI7D project for its support and assistance in the
development of this work.
