local t = {}

for i in game:DefineFastString("SduiNonGameTopicIds", "300000000, 600000000, 100000010"):gmatch("(%w+)") do
	t[i] = true
end
return function(p1, p2)
	-- upvalues: t (ref)
	return p1 == "sdui" and (if p2 == nil then false else not t[tostring(p2)])
end