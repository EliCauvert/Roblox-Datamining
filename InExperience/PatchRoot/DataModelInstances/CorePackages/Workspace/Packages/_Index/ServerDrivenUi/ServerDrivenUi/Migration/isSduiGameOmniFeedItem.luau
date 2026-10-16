local t = {}

for i in game:DefineFastString("SduiNonGameTopicIds", "300000000, 600000000, 100000010"):gmatch("(%w+)") do
	t[i] = true
end
return function(p1, p2): boolean --[[ Line: 11 | Named "isSduiGameOmniFeedItem" ]]
	-- upvalues: t (copy)
	return p1 == "sdui" and (p2 ~= nil and not t[tostring(p2)])
end