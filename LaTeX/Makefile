############################################################################
#
#  $HeadURL$
#  $Author$
#  $Date$
#  $Revision$
#
###########################################################################
#
#       This confidential and proprietary software may be used only
#      as authorized by a licensing agreement from the Institute for
#     Integrated Signal Processing Systems of the RWTH Aachen (Germany).
#
#                         II     SSSS    SSSS
#                         II    SS      SS
#                         II     SS      SS
#                         II       SS      SS
#                         II    SSSS    SSSS
#
#                            (C) COPYRIGHT
#             INSTITUTE FOR INTEGRATED SIGNAL PROCESSING SYSTEMS
#                             RWTH AACHEN
#                         ALL RIGHTS RESERVED
#
###########################################################################
#
#                     Author:  Ernst Martin Witte
#                    Contact:  witte@iss.rwth-aachen.de
#
###########################################################################
#
#   Useful Makefile Targets:
#
#        all     runs make in subdirectory figures and creates thesis.pdf
#        pdf     creates thesis.pdf
#        ps      creates thesis.ps
#        view    creates thesis.pdf and start the selected viewer (see tools section)
#
###########################################################################


###################################################
#       Paths and Main Document Source            #
###################################################

MAIN          = thesis
FIGURE_PATH   = ./figures
BIB_PATH      = bib
STYLES_PATH   = styles
IEEEtran_PATH = styles/ieee-latex-style

###################################################
#    Default automatic dependency resolution      #
###################################################

TEX_FILES    = $(wildcard *.tex)
FIGURES_EPS  = $(wildcard $(FIGURE_PATH)/*.eps $(FIGURE_PATH)/*/*.eps)
BIB_FILES    = $(wildcard $(BIB_PATH)/*.bib)
AUX_FILES    = $(patsubst %.tex, %.aux, $(TEX_FILES))
BIB_TMPFILES = $(MAIN).bbl $(MAIN).blg
TARGET_FILES = $(MAIN).ps  $(MAIN).pdf $(MAIN).dvi
LOG_FILES    = $(MAIN).out $(MAIN).log
TMP_FILES    = $(MAIN).toc $(MAIN).lof $(MAIN).lot
STYLE_FILES  = $(wildcard styles/*.cls styles/*.sty)

export TEXINPUTS := $(STYLES_PATH):.:$(TEXINPUTS)
export BIBINPUTS := $(BIB_PATH):.:$(BIBINPUTS)
export BSTINPUTS := $(BIB_PATH):.:$(BSTINPUTS)

###################################################
#    Tools Selection and default parameters       #
###################################################

# the ps2pdf options you want to use
PDF_OPTIONS         = $(PDF_OPTIONS_DEFAULT) $(PDF_OPTIONS_A4)

# ps2pdf options template for letter paper format 
PDF_OPTIONS_LETTER  = -sPAPERSIZE=letter

# ps2pdf options template for A4 paper format
PDF_OPTIONS_A4      = -sPAPERSIZE=a4


# WARNING for font embedding:
# 
#  *mandatory* options for font embedding are
#  (font embedding will only work partially if any option is missing)
#
#    -dPDFSETTINGS=/printer  (this is particularly important, e.g. for Standard and Dingbats fonts)
#    -dEmbedAllFonts=true  
#    -dSubsetFonts=true    
#    -dMaxSubsetPct=100
#    
 
PDF_OPTIONS_FONT_EMBEDDING = -dPDFSETTINGS=/printer        \
                             -dEmbedAllFonts=true          \
                             -dSubsetFonts=true            \
                             -dMaxSubsetPct=100

# ps2pdf options template for useful defaults (embedded fonts, etc) 
PDF_OPTIONS_DEFAULT = -dCompatibilityLevel=1.3             \
                      -r600                                \
                      -dAutoRotatePages=/None              \
                      -dCompressPages=true                 \
                      -dASCII85EncodePages=false           \
                      -dUseFlateCompression=true           \
                      $(PDF_OPTIONS_FONT_EMBEDDING)

# ps2pdf options template for IEEE publications (mainly for pixmap processing) 
PDF_OPTIONS_IEEE    = $(PDF_OPTIONS_DEFAULT)               \
                      -dConvertCMYKImagesToRGB=false       \
                      -dAutoFilterColorImages=true         \
                      -dColorImageFilter=/DCTEncode        \
                      -dEncodeColorImages=true             \
                      -dDownsampleColorImages=true         \
                      -dColorImagesDepth=-1                \
                      -dColorImageResolution=300           \
                      -dColorImageDownsampleThreshold=1    \
                      -dColorImageDownsampleType=/Bicubic  \
                      -dAutoFilterGrayImages=true          \
                      -dGrayI                              \
                      -dEncodeGrayImages=true              \
                      -dDownsampleGrayImages=true          \
                      -dGrayImageDownsampleThreshold=1     \
                      -dGrayImageDownsampleType=/Bicubic   \
                      -dGrayImageDepth=-1                  \
                      -dGrayImageResolution=300            \
                      -dMonoImageFilter=/CCITTFaxEncode    \
                      -dEncodeMonoImages=true              \
                      -dDownsampleMonoImages=true          \
                      -dMonoImageDownsampleThreshold=1     \
                      -dMonoImageDownsampleType=/Bicubic   \
                      -dMonoImageDepth=-1                  \
                      -dMonoImageResolution=600

###################################################
#           Tools Selection                       #
###################################################

DVI2PS      = dvips
PS2PDF      = ps2pdf
BIBTEX      = bibtex
LATEX       = latex
PDF_VIEWER  = acroread
PS_VIEWER   = gv
DVI_VIEWER  = xdvi

###################################################

all: .figures pdf

pdf: $(MAIN).pdf

ps:  $(MAIN).ps

view: all view-$(MAIN).pdf

.figures:
	@$(MAKE) -C $(FIGURE_PATH)

clean:
	rm -f $(AUX_FILES) $(TARGET_FILES) $(LOG_FILES) $(BIB_TMPFILES) $(TMP_FILES)

%.dvi: %.tex $(TEX_FILES) $(FIGURES_EPS) $(BIB_FILES) $(STYLE_FILES)
	$(MAKE) latex-$(basename $<)
	$(MAKE) bibtex-$(basename $<)
	$(MAKE) latex-$(basename $<)

%.ps: %.dvi
	$(DVI2PS) $< -o $@ || ( rm -f $@ ; false )

%.pdf: %.ps
	$(PS2PDF) $(PDF_OPTIONS)  $<  || ( rm -f $@ ; false )

# unconditional run of latex
# dependencies are checked before target latex is run
latex-%:
	$(LATEX) $(patsubst latex-%, %.tex, $@) || ( rm -f $(patsubst latex-%, %.aux %.dvi, $@) ; false )
	$(LATEX) $(patsubst latex-%, %.tex, $@) || ( rm -f $(patsubst latex-%, %.aux %.dvi, $@) ; false )

# unconditional run of bibtex
# dependencies are checked before target bibtex is run
bibtex-%:
	$(BIBTEX) $(patsubst bibtex-%, %, $@)   || ( rm -f  $(patsubst bibtex-%, %.bbl %.blg, $<); false )
	$(BIBTEX) $(patsubst bibtex-%, %, $@)   || ( rm -f  $(patsubst bibtex-%, %.bbl %.blg, $<); false )

# unconditional viewer
# dependencies are checked before target view... is run
view-%.pdf:
	$(PDF_VIEWER) $(patsubst view-%, %, $@)
view-%.ps:
	$(PS_VIEWER)  $(patsubst view-%, %, $@)
view-%.dvi:
	$(DVI_VIEWER) $(patsubst view-%, %, $@)

###################################################
#         Using the IEEE latex style              #
###################################################

include $(IEEEtran_PATH)/Makefile.inc.make
