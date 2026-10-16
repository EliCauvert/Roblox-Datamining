local PromiseModule = require(script:FindFirstAncestor("EditProfileBackground").Parent.Promise)
local Players = game:GetService("Players")
local NewResults = {}
local AvatarModelPrefetchModule = {
	prefetch = function(Key) --[[ Line: 11 ]]
		-- upvalues: NewResults (copy), PromiseModule (copy), Players (copy)
		if not NewResults[Key] then
			NewResults[Key] = PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 16 ]]
				-- upvalues: Players (upval), Key (copy)
				local Success, Result = pcall(function() --[[ Line: 17 ]]
					-- upvalues: Players (upval), Key (upval)
					return Players:CreateHumanoidModelFromUserIdAsync(Key)
				end)
				
				if Success and Result then
					Callback1(Result)
					
					return
				else
					Callback("CharacterModelCreationFailed")
				end
			end)
			
			return
		end
	end
}

function AvatarModelPrefetchModule.get(p1) --[[ Line: 28 ]]
	-- upvalues: NewResults (copy), AvatarModelPrefetchModule (copy)
	if NewResults[p1] then
		return NewResults[p1]
	else
		AvatarModelPrefetchModule.prefetch(p1)
		
		return NewResults[p1]
	end
end

function AvatarModelPrefetchModule.clear(Key) --[[ Line: 37 ]]
	-- upvalues: NewResults (copy)
	NewResults[Key] = nil
end

return AvatarModelPrefetchModule