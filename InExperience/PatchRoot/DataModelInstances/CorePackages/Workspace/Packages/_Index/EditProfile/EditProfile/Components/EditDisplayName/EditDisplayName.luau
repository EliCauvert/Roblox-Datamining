local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local textInput = foundationModule.TextInput
local iconName = foundationModule.Enums.IconName
local textKeysModule = require(editProfile.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local constantsModule = require(editProfile.Common.Constants)
local useDisplayNameTextModule = require(editProfile.Hooks.useDisplayNameText)
local luauPolyfillModule = require(parent.LuauPolyfill)
local clearTimeout = luauPolyfillModule.clearTimeout
local setTimeout = luauPolyfillModule.setTimeout
local analyticsServiceV2Module = require(editProfile.Analytics.AnalyticsServiceV2)
local maxDisplayNameCharacters = game:DefineFastInt("MaxDisplayNameCharacters", 20)
local minDisplayNameCharacters = game:DefineFastInt("MinDisplayNameCharacters", 3)
local displayNameValidationNetworkDelay = game:DefineFastInt("DisplayNameValidationNetworkDelay", 500)

return function(p0)
	-- upvalues: useLocalization (ref), textKeysModule (ref), useDisplayNameTextModule (ref), reactModule (ref), setTimeout (ref), displayNameValidationNetworkDelay (ref), constantsModule (ref), clearTimeout (ref), minDisplayNameCharacters (ref), analyticsServiceV2Module (ref), maxDisplayNameCharacters (ref), view (ref), text (ref), textInput (ref), iconName (ref)
	local var11 = useLocalization({ DisplayNameCaption = textKeysModule.DisplayNameCaption })
	local var12 = useDisplayNameTextModule()
	local var13, var14 = reactModule.useState(p0.initialDisplayName)
	local var15, var16 = reactModule.useState(false)
	local var17, var18 = reactModule.useState(var12.displayNameChangeError)
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useRef(setTimeout(function() end, displayNameValidationNetworkDelay))
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var15 (ref), var19 (ref)
		if p0.updateErrorState then
			p0.updateErrorState(var15 or var19)
		end
	end, { var15, var19 })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), p0 (ref)
		var14(p0.initialDisplayName)
	end, { p0.initialDisplayName })
	
	local function getErrorMessage(p1)
		-- upvalues: constantsModule (copy), var12 (ref)
		return ({
			[constantsModule.DisplayNameValidationErrorCodes.TooShort] = var12.nameTooShortError,
			[constantsModule.DisplayNameValidationErrorCodes.TooLong] = var12.nameTooLongError,
			[constantsModule.DisplayNameValidationErrorCodes.InvalidCharacters] = var12.nameUnsupportedCharsError,
			[constantsModule.DisplayNameValidationErrorCodes.Moderated] = var12.nameInappropriateError,
			[constantsModule.DisplayNameValidationErrorCodes.Throttled] = var12.nameHasChangedError,
			[constantsModule.DisplayNameValidationErrorCodes.InvalidCharacterSetCombination] = var12.displayNameChangeMixedCharactersError,
			[constantsModule.DisplayNameValidationErrorCodes.NameNotAvailable] = var12.nameNotAvailableError
		})[p1] or var12.displayNameChangeError
	end
	
	local function textChanged(p2)
		-- upvalues: clearTimeout (copy), var21 (ref), var14 (ref), var16 (ref), var20 (ref), minDisplayNameCharacters (copy), analyticsServiceV2Module (copy), var18 (ref), var12 (ref), maxDisplayNameCharacters (copy), setTimeout (copy), p0 (ref), getErrorMessage (ref), displayNameValidationNetworkDelay (copy)
		clearTimeout(var21.current)
		p2 = p2 or ""
		local var24 = utf8.len(p2) or 0
		var14(p2)
		var16(false)
		var20(false)
		
		if var24 < minDisplayNameCharacters then
			analyticsServiceV2Module.sendDisplayNameTooShort(p2)
			var18(var12.nameTooShortError)
			var16(true)
			
			return
		elseif maxDisplayNameCharacters < var24 then
			var18(var12.nameTooLongError)
			var16(true)
			
			return
		end
		var20(true)
		var21.current = setTimeout(function()
			-- upvalues: p0 (copy), p2 (write), var16 (copy), var20 (copy), analyticsServiceV2Module (copy), var18 (copy), getErrorMessage (copy)
			p0.validateDisplayName(p2):andThen(function(_)
				-- upvalues: var16 (copy), var20 (copy), p0 (copy), p2 (copy)
				var16(false)
				var20(false)
				p0.onDataChange(p2)
			end):catch(function(p3)
				-- upvalues: analyticsServiceV2Module (copy), p2 (copy), var18 (copy), getErrorMessage (copy), var16 (copy), var20 (copy)
				local var25 = if p3 and p3.errors and p3.errors[1] then p3.errors[1].code or -1 else -1
				analyticsServiceV2Module.sendFilteredDisplayName(p2)
				var18(getErrorMessage(var25))
				var16(true)
				var20(false)
			end)
		end, displayNameValidationNetworkDelay)
	end
	
	return reactModule.createElement(view, {
		tag = "auto-y col gap-medium bg-transparent",
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Caption = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left",
			Text = var11.DisplayNameCaption
		}),
		DisplayNameInput = reactModule.createElement(textInput, {
			LayoutOrder = 2,
			label = "",
			tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left",
			text = var13,
			width = UDim.new(1, 0),
			placeholder = p0.initialDisplayName,
			hint = if var15 then var17 else string.format("%d/%d", utf8.len(var13 or "") or 0, maxDisplayNameCharacters),
			onChanged = function(p4)
				-- upvalues: textChanged (ref)
				textChanged(p4)
			end,
			hasError = var15,
			iconTrailing = if var13 and #var13 > 0 then {
				name = iconName.CircleX,
				onActivated = function()
					-- upvalues: textChanged (ref)
					textChanged("")
				end
			} else nil,
			textBoxRef = p0.textBoxRef
		})
	})
end