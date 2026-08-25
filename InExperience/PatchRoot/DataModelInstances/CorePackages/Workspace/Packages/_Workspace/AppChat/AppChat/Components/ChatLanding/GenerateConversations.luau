local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return {
	init = function()
		-- upvalues: cryoModule (ref)
		local function generate(p0)
			return {
				presenceImage = "",
				alias = "(alias)",
				id = p0,
				title = string.format("default dog chat no. %d", p0),
				thumbnails = { "rbxassetid://2610133241" },
				messages = {
					keys = { "messageId" },
					values = {
						messageId = {
							content = "a message placeholder \240\159\142\183\240\159\144\155"
						}
					}
				},
				shortRelativeTime = "now+" .. p0
			}
		end
		
		local t = {}
		
		for i = 0, 200 do
			table.insert(t, generate(i))
		end
		return {
			getItemList = function()
				-- upvalues: t (ref)
				return t
			end,
			loadNext = function(p1)
				-- upvalues: cryoModule (copy), generate (ref)
				return cryoModule.List.join(p1, { generate(p1[#p1].id + 1) })
			end,
			loadPrevious = function(p2)
				-- upvalues: cryoModule (copy), generate (ref)
				return cryoModule.List.join({ generate(p2[1].id - 1) }, p2)
			end
		}
	end
}