use strict;
use warnings;

chomp(my $rc = <>);
chomp(my $cc = <>);

my @matrix = (
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0]
);

for(my $i=0;$i<$rc;$i++) {
    for(my $j=0;$j<$cc;$j++) {
        chomp($matrix[$i][$j] = <>);
    }
}

local $| = 1;

# Reduce Matrix
for(my $k=0;$k<$rc-1;$k++) {
    my $pivot=0;
    while($pivot<$cc && $matrix[$k][$pivot]==0) {
        $pivot++;
    }
    if($pivot>=$cc) {
        continue;
    }
    for(my $i=$k+1;$i<$rc;$i++) {
        my $mul = -$matrix[$i][$pivot]/$matrix[$k][$pivot];
        
        for(my $j=0;$j<$cc;$j++) {
            $matrix[$i][$j]=$matrix[$i][$j]+$mul*$matrix[$k][$j];
        }
    }

    # for(my $i=0;$i<$rc;$i++) {
    #     for(my $j=0;$j<$cc;$j++) {
    #         print($matrix[$i][$j]," ");
    #     }
    #     print "\n";
    # }
}


# Sorting Pivot (Selection Sort)
for(my $i=0;$i<$rc-1;$i++) {
    my $rowpivot = $i;
    my $currentpivot = 0;
    while($currentpivot<$cc && $matrix[$i][$currentpivot]==0) {
        $currentpivot++;
    }

    # Find sorting point location
    for(my $j=$i+1;$j<$rc;$j++)
    {
        my $pivot=0;
        while($pivot<$cc && $matrix[$i][$pivot]==0) {
            $pivot++;
        }
        if($pivot<$currentpivot)
        {
            $currentpivot=$pivot;
            $rowpivot=$j;
        }
    }
    # Swap row
    for(my $j=0;$j<$cc;$j++)
    {
        my $tmp=$matrix[$i][$j];
        $matrix[$i][$j]=$matrix[$rowpivot][$j];
        $matrix[$rowpivot][$j]=$tmp;
    }
}

# Echelon form by multiplying
for(my $i=0;$i<$rc;$i++)
{
    my $pivot=0;
    while($pivot<$cc && $matrix[$i][$pivot]==0) {
        $pivot++;
    }
    if($pivot<$cc)
    {
        my $mul=(1/$matrix[$i][$pivot]);
        for(my $j=0;$j<$cc;$j++)
        {
            $matrix[$i][$j]*=$mul;
        }
        # for(my $t=0;$t<$rc;$t++) {
        #     for(my $j=0;$j<$cc;$j++) {
        #         print($matrix[$t][$j]," ");
        #     }
        #     print "\n";
        # }
    } 
}
for(my $i=0;$i<$rc;$i++) {
    for(my $j=0;$j<$cc;$j++) {
        print($matrix[$i][$j]," ");
    }
    print "\n";
}

my $zeroRow=0;

for(my $i=0;$i<$rc;$i++)
{
    my $isAllZero=1;
    my $j=0;
    while($isAllZero==1 && $j<$cc)
    {
        if($matrix[$i][$j]!=0)
        {
            $isAllZero=0;
        }
        else
        {
            $j++;
        }
    }

    if($isAllZero==1)
    {
        $zeroRow++;
    }
}

my $rank=$rc-$zeroRow;
my $nullity=$cc-$rank;

print "Rank of Matrix is $rank\n";
print "Nullity of Matrix is $nullity\n";



