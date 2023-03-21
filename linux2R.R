sed_s <- function(file, from, to){
  #' @description sed 替换(sed -i 's/from/to/' file)
  #' @return NULL
  paste0("sed -i 's/", from, "/", to, "/' ", file)
}

`sed_s_#` <- function(file, from, to){
  #' @description sed 替换(sed -i 's#from#to#' file)
  #' @return NULL
  paste0("sed -i 's#", from, "#", to, "#' ", file)
}

sed_n_s <- function(file, row, from, to){
  #' @description sed 替换指定行(sed -i 'row s/from/to/' file)
  #' @return NULL
  paste0("sed -i '", row, "s/", from, "/", to, "/' ", file)
}

sed_n_sel <- function(file, row, pattern, col){
  #' @description 根据特征提取file指定行的字符(sed -n 'row p' file | awk -F "pattern" '{print $col}')
  #' @return 字符
  paste0("sed -n '", row, "p' ", file, " | awk -F '", pattern, "' '{print $", col, "}'")
}

sed_n_p <- function(file, row){
  #' @description 输出指定行(sed -n 'row p' file)
  #' @return 指定行内容
  paste0("sed -n '", row, "p' ", file)
}

sed_range_p <- function(file, outFile, pattern1, pattern2){
  #' @description 提取file特征之间的所有行并重定向(sed -n '/pattern1/,/pattern2/p' file > outFile)
  #' @return 无输出，但做了重定向
  paste0("sed -n '/", pattern1, "/, /", pattern2, "/p' ", file, " > ", outFile)
}

sed_r_pattern <- function(file, inputFile, pattern){
  #' @description 根据特征(其后)给file中插入文件(sed -i '/pattern/r inputFile' file)
  paste0("sed -i '/", pattern, "/r ", inputFile, "' ", file)
}
# shell(cmd = sed_r_pattern(file = name.orign_apsim, inputFile = "single_simulation.out", pattern = "\\/simulation"))

sed_r_row <- function(file, inputFile, row){
  #' @description 根据行号(其后)给file中插入文件(sed -i '/pattern/r inputFile' file)
  paste0("sed -i '", row, "r ", inputFile, "' ", file)
}

grep_n <- function(file, pattern){
  #' @description grep并返回行号(grep -n pattern file | awk '{print $1}')
  #' @return 行号
  paste0("grep -n '", pattern, "' ", file, " | awk '{print $1}'")
}

wc_l <- function(file){
  #' @description 返回file的行数
  paste0("wc -l ", file, " | awk '{print $1}'")
}


