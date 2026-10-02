local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.Parent.Types)
local _ = require(script.Parent.groupMessages)

local function _(p1)
	return p1.message.author ~= nil and p1.groupPosition.isFirst
end

local function structureKeyOf(p1)
	local t = {}
	
	for i, v in p1.message.contents do
		table.insert(t, v.kind)
	end
	return tostring(p1.message.author ~= nil and p1.groupPosition.isFirst) .. "|" .. table.concat(t, ",")
end

return function(p2)
	-- upvalues: reactModule (ref), signalsModule (ref), structureKeyOf (ref), signalsReactModule (ref)
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), structureKeyOf (copy), p2 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: structureKeyOf (copy), p2 (copy)
			return structureKeyOf(p2(p3))
		end)
	end, { p2 }))
	local var2 = reactModule.useMemo(function()
		-- upvalues: p2 (ref)
		local var3 = p2(false)
		local t = {}
		
		for i, v in var3.message.contents do
			t[i] = {
				kind = v.kind,
				getContent = function(p3)
					-- upvalues: p2 (copy), i (ref)
					return p2(p3).message.contents[i]
				end
			}
		end
		return {
			hasIdentity = var3.message.author ~= nil and var3.groupPosition.isFirst,
			contents = t
		}
	end, { p2, var1 })
	
	return {
		structureKey = var1,
		hasIdentity = var2.hasIdentity,
		getIdentity = reactModule.useMemo(function()
			-- upvalues: p2 (ref)
			return function(p3)
				-- upvalues: p2 (copy)
				local author = p2(p3).message.author
				
				return if author == nil then nil else {
					isRobloxVerified = false,
					userId = author.userId,
					displayName = author.displayName,
					avatarContent = `rbxthumb://type=AvatarHeadShot&id={author.userId}&w=150&h=150`
				}
			end
		end, { p2 }),
		contents = var2.contents
	}
end