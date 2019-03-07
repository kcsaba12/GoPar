function sequence  = create_rnd_seq(labels, runs, name)
sequence = zeros(1,labels*runs);

% 1 -> j:1--
for i = 0:runs
    for j = 1:labels
        sequence(1,i*labels+j) = j;
    end
end

sequence = sequence(randperm(length(sequence)));

save(name,"sequence");
