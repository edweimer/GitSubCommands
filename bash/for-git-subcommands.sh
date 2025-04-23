declare branch_base="";

declare branch_current=$(git branch | grep "^*" | cut -d " " -f 2-);
declare client=${branch_current%%/*};

branch_base=${branch_current#temp/};
