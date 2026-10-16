local CryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return {
	init = function() --[[ Line: 11 ]]
		-- upvalues: CryoModule (copy)
		local function generate(Id) --[[ Line: 12 ]]
			return {
				presenceImage = "",
				alias = "(alias)",
				id = Id,
				title = string.format("default dog chat no. %d", Id),
				thumbnails = { "rbxassetid://2610133241" },
				messages = {
					keys = { "messageId" },
					values = {
						messageId = { content = "a message placeholder 🎷🐛" }
					}
				},
				shortRelativeTime = "now+" .. Id
			}
		end
		
		local List = {}
		
		for i = 0, 200 do
			table.insert(List, (generate(i)))
		end
		return {
			getItemList = function() --[[ Line: 38 ]]
				-- upvalues: List (copy)
				return List
			end,
			loadNext = function(p1) --[[ Line: 42 ]]
				-- upvalues: CryoModule (upval), generate (copy)
				return CryoModule.List.join(p1, { (generate(p1[#p1].id + 1)) })
			end,
			loadPrevious = function(Entry) --[[ Line: 46 ]]
				-- upvalues: CryoModule (upval), generate (copy)
				return CryoModule.List.join({ (generate(Entry[1].id - 1)) }, Entry)
			end
		}
	end
}