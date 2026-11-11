local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local TutilsModule = require(CorePackages.Packages.tutils)

return require(CorePackages.Packages.Rodux).createReducer({ hasBlur = false, blurDisplayOrder = 0, details = {} }, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetScreenGuiBlur).name] = function(p1, p2)
		-- upvalues: CryoModule (copy), TutilsModule (copy)
		local JoinResult = if p2.blur == true then CryoModule.Dictionary.join(p1.details, { [p2.source] = p2.displayOrder }) else CryoModule.Dictionary.join(p1.details, { [p2.source] = CryoModule.None })
		local IsFieldCountResultAbove = TutilsModule.fieldCount(JoinResult) > 0
		local Largest = 0
		
		for _, value in pairs(JoinResult) do
			Largest = math.max(Largest, value)
		end
		return {
			hasBlur = IsFieldCountResultAbove,
			blurDisplayOrder = Largest,
			details = JoinResult
		}
	end
})