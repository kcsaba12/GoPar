function sequence  = create_rnd_seq(labels, runs)

sequence = zeros(1,labels*runs);

for i = 0:runs
    for j = 1:labels
        sequence(1,i*labels+j) = j;
    end
end

sequence = sequence(randperm(length(sequence)));
