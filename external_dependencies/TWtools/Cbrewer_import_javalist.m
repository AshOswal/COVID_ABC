X = {'rgb(247,252,240)','rgb(224,243,219)','rgb(204,235,197)','rgb(168,221,181)','rgb(123,204,196)','rgb(78,179,211)','rgb(43,140,190)','rgb(8,104,172)','rgb(8,64,129)'}
for i =1:numel(X)
    cmap(i,:) = eval(['[' X{i}(5:end-1) ']']);
end