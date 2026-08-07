local t = {}

for i, v in string.split(require(script.Parent.Flags).FoundationImagesWhitelistedIconAssets, ",") do
	t[v] = true
end
return t