local parent = script.Parent.Parent
local openPublishAssetPromptModule = require(parent.Actions.OpenPublishAssetPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p0, p1, p2, p3) --[[ line: 12 ]]
	-- upvalues: openPublishAssetPromptModule (ref), promptTypeModule (ref)
	return function(p4) --[[ line: 13 ]]
		-- upvalues: p0 (write), openPublishAssetPromptModule (copy), promptTypeModule (copy), p1 (ref), p2 (ref), p3 (ref)
		if p0:IsA("Accessory") then
			local model = Instance.new("Model")
			model.Parent = p0.Parent
			p0.Parent = model
			local basePart = p0:FindFirstChildWhichIsA("BasePart", true)
			
			if basePart == nil then
				print("Error: accessory to be published does not contain a BasePart")
			else
				model.PrimaryPart = basePart
				p0 = model
			end
		end
		p4:dispatch(openPublishAssetPromptModule(promptTypeModule.PublishAssetSingleStep, p0, p1, p2, p3))
	end
end