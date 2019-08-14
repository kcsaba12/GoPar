function sequence  = create_rnd_seq(labels, runs)

sequence = zeros(1,length(labels)*runs);

for i = 0:(runs-1)
    for j = 1:length(labels)
        lab = labels(j);
        sequence(1,i*length(labels)+j) = lab;
    end
end

sequence = sequence(randperm(length(sequence)));
