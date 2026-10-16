local Parent = script.Parent.Parent
local OpenPublishAssetPromptModule = require(Parent.Actions.OpenPublishAssetPrompt)
local PromptTypeModule = require(Parent.PromptType)

return function(Object, p1, p2, p3) --[[ Line: 12 ]]
	-- upvalues: OpenPublishAssetPromptModule (copy), PromptTypeModule (copy)
	return function(p4) --[[ Line: 13 ]]
		-- upvalues: Object (ref), OpenPublishAssetPromptModule (upval), PromptTypeModule (upval), p1 (copy), p2 (copy), p3 (copy)
		if Object:IsA("Accessory") then
			local Model = Instance.new("Model")
			Model.Parent = Object.Parent
			Object.Parent = Model
			local BasePart = Object:FindFirstChildWhichIsA("BasePart", true)
			
			if BasePart == nil then
				print("Error: accessory to be published does not contain a BasePart")
			else
				Model.PrimaryPart = BasePart
				Object = Model
			end
		end
		p4:dispatch(OpenPublishAssetPromptModule(PromptTypeModule.PublishAssetSingleStep, Object, p1, p2, p3))
	end
end