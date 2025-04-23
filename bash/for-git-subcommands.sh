declare branch_base="";
declare branch_temp="";

declare branch_current=$(git branch | grep "^*" | cut -d " " -f 2-);
declare client=${branch_current%%/*};

branch_base=${branch_current#temp/};
branch_temp="temp/${branch_base}";
