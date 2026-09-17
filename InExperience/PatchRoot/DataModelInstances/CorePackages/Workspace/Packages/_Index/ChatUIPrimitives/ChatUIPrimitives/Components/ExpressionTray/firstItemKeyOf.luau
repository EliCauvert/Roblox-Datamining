local _ = require(script:FindFirstAncestor("ChatUIPrimitives").UniversalMessage.Types)

return {
	expressionKey = function(p1)
		return if p1.kind == "preset" then "preset:" .. p0.presetId elseif p1.kind == "emoji" then "emoji:" .. p0.emojiId elseif p1.kind == "asset" then "asset:" .. p0.assetId else "plain-text"
	end,
	firstItemKeyOf = function(p1, p2)
		for i, v in p1 do
			if v.categoryGroupId == p2 then
				for i_1, v_1 in v.categories do
					if v_1.items[1] ~= nil then
						local content = v_1.items[1].content
						
						return if content.kind == "preset" then "preset:" .. content.presetId elseif content.kind == "emoji" then "emoji:" .. content.emojiId elseif content.kind == "asset" then "asset:" .. content.assetId else "plain-text"
					end
				end
				return nil
			end
		end
		return nil
	end
}