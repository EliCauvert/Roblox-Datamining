local DependenciesModule = require(script:FindFirstAncestor("SocialTab").dependencies)
local T = DependenciesModule.t
local Text = DependenciesModule.Text
local MemoizeFunction = DependenciesModule.memoize
local InterfaceResult = T.interface({
	text = T.string,
	font = T.interface({ Font = T.Font, RelativeSize = T.number }),
	baseSize = T.number
})

return function()
	-- upvalues: MemoizeFunction (copy), InterfaceResult (copy), Text (copy)
	return MemoizeFunction(function(Text1, p1, BaseSize)
		-- upvalues: InterfaceResult (upval), Text (upval)
		assert(InterfaceResult({ text = Text1, font = p1, baseSize = BaseSize }))
		
		return Text.GetTextBounds(Text1, p1.Font, p1.RelativeSize * BaseSize, Vector2.new(10000, 10000))
	end)
end