local parent = script.Parent.Parent
local openPublishAssetPromptModule = require(parent.Actions.OpenPublishAssetPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p1, p2, p3, p4)
	-- upvalues: openPublishAssetPromptModule (ref), promptTypeModule (ref)
	return function(p5)
		-- upvalues: p1 (write), openPublishAssetPromptModule (copy), promptTypeModule (copy), p2 (ref), p3 (ref), p4 (ref)
		if p1:IsA("Accessory") then
			local model = Instance.new("Model")
			model.Parent = p1.Parent
			p1.Parent = model
			local basePart = p1:FindFirstChildWhichIsA("BasePart", true)
			
			if basePart == nil then
				print("Error: accessory to be published does not contain a BasePart")
			else
				model.PrimaryPart = basePart
				p1 = model
			end
		end
		p5:dispatch(openPublishAssetPromptModule(promptTypeModule.PublishAssetSingleStep, p1, p2, p3, p4))
	end
end