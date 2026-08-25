local t = {}

for i in game:DefineFastString("SduiNonGameTopicIds", "300000000, 600000000, 100000010"):gmatch("(%w+)") do
	t[i] = true
end
return function(p0, p1)
	-- upvalues: t (ref)
	return p0 == "sdui" and (if p1 == nil then false else not t[tostring(p1)])
end