local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)
local SizingModule = require(script.Parent.Parent.Sizing)

return function()
	-- upvalues: SizingModule (copy), ReactModule (copy)
	local ContentMaxWidth = SizingModule.useSizing().bubble.contentMaxWidth
	
	return ReactModule.useMemo(function()
		-- upvalues: ContentMaxWidth (copy)
		return {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(ContentMaxWidth, 1e999)
		}
	end, { ContentMaxWidth })
end