# meson build file for stm32 F1 libary

project('opencm3_stm32f1', 'c')

subdir('lib/cm3')
subdir('lib/usb')
subdir('lib/stm32')
subdir('lib/stm32/f1')

# generate the nvic files from the json files...
# make this work both as a meson subproject and as a stand alone project
if meson.is_subproject()
    subproject_dir = '/subprojects/libopencm3'
else
    subproject_dir = ''
endif
project_root_dir = '@0@@1@'.format(meson.source_root(), subproject_dir)
genscript = files('@0@/meson/genirqfiles.sh'.format(project_root_dir))
irqgenfiles = custom_target('irq2nvic',
  input : './include/libopencm3/stm32/f1/irq.json',
  output : [ 'nvic.h' ],
  command : [ genscript, project_root_dir, '@INPUT@'],
  )

l_c_args = [ '-Os', '-ffunction-sections', '-fdata-sections',  '-DSTM32F1', '-Wstrict-prototypes' ]

i = include_directories('include')
l = static_library('opencm3_stm32f1', stm32f1_src, irqgenfiles, stm32f1_common_src, stm32f1_cm3_src, stm32f1_usb_src,
    c_args: [l_c_args], include_directories : i)

# this next part declares a meson dependency so that other meson projects can include
# libopencm3 as a git submodule and It Just Works.
libopencm3_dep = declare_dependency(include_directories : i, link_with : l)
