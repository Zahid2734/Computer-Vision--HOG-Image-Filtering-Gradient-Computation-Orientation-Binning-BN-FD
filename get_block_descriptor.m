function ori_histo_normalized = get_block_descriptor(ori_histo,block_size)
    m = size(ori_histo,1);
    n = size(ori_histo,2);
    k = size(ori_histo,3);

    M = m - (block_size -1);
    N = n - (block_size -1);
    for row = 1: M
        for col = 1: N
               blockHists = ori_histo(row : row + 1, col : col + 1, :);
               magnitude = norm(blockHists(:)) + 0.01;
               normalized = blockHists / magnitude;    
               ori_histo_normalized(row,col,:) = normalized(:);
        end
        
    end
end