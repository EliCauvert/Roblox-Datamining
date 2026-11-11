local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local StyleModule = require(Parent.Style)
local ResponsiveModule = require(Parent.Responsive)
local HasExtraPlatformInsetFunction = ResponsiveModule.HardwareSafeAreaInsets.hasExtraPlatformInset
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local UseMemoFunction = require(Parent.React).useMemo
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

local function _(p1: number, p2)
	return if p1 < 1024 then p2.Size.Size_300 elseif p1 < 1280 then 18 elseif p1 < 1440 then p2.Size.Size_600 elseif p1 < 1920 then 34 elseif p1 < 2260 then 38 else p2.Size.Size_1200
end

local _ = function(p1, p2: number)
	-- upvalues: HasExtraPlatformInsetFunction (copy)
	return if HasExtraPlatformInsetFunction() then p1.Size.Size_1600 elseif p2 < 1024 then p1.Size.Size_300 elseif p2 < 1280 then 18 elseif p2 < 1440 then p1.Size.Size_600 elseif p2 < 1920 then 34 elseif p2 < 2260 then 38 else p1.Size.Size_1200
end

return function(p1)
	-- upvalues: UseIsInExperienceModule (copy), UseScreenSizeFunction (copy), StyleModule (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), UseSelectorFunction (copy), UseMemoFunction (copy), HasExtraPlatformInsetFunction (copy), FormFactor (copy)
	local UseIsInExperienceModuleResult = UseIsInExperienceModule() or p1
	local UseScreenSizeResult = UseScreenSizeFunction()
	local X = if UseScreenSizeResult and UseScreenSizeResult.X ~= nil then UseScreenSizeResult.X else 0
	local UseDesignTokensResult = StyleModule.useDesignTokens()
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Pointer
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.FormFactor
	end)
	
	return UseMemoFunction(function()
		-- upvalues: UseIsInExperienceModuleResult (copy), IsUsePreferredInputResultMatch (copy), UseDesignTokensResult (copy), X (copy), HasExtraPlatformInsetFunction (upval), UseSelectorResult (copy), FormFactor (upval)
		if UseIsInExperienceModuleResult then
			return { outer = 12, inner = 12, default = 12 }
		else
			local Size1600 = if IsUsePreferredInputResultMatch then if HasExtraPlatformInsetFunction() then UseDesignTokensResult.Size.Size_1600 elseif X < 1024 then UseDesignTokensResult.Size.Size_300 elseif X < 1280 then 18 elseif X < 1440 then UseDesignTokensResult.Size.Size_600 elseif X < 1920 then 34 elseif X < 2260 then 38 else UseDesignTokensResult.Size.Size_1200 elseif UseSelectorResult == FormFactor.COMPACT then 24 else 48
			
			return { default = 12, outer = Size1600, inner = Size1600 }
		end
	end, {
		X,
		IsUsePreferredInputResultMatch,
		UseSelectorResult,
		UseIsInExperienceModuleResult
	})
end