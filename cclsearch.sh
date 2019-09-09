#!/bin/ksh
find_clinic_use() {
        for file in *.prg *.inc *.ccl;do
                grep -H -w 71 $file | egrep 'CLINIC|Clinic'
                grep -H -w 4049400 $file
        done
}

ccl_directories_search() {
        cd $CCLUSERDIR;pwd
        find_clinic_use

        for pathdir in "reports" "extracts" "requisitions" "labels" "mpages" "vendor" "tokens" "templates" "rules";do
                cd $cust_script/$pathdir;pwd
                find_clinic_use
        done
}

ccl_directories_search
