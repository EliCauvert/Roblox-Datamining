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

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), useDisplayNameTextModule (ref), reactModule (ref), setTimeout (ref), displayNameValidationNetworkDelay (ref), constantsModule (ref), clearTimeout (ref), minDisplayNameCharacters (ref), analyticsServiceV2Module (ref), maxDisplayNameCharacters (ref), view (ref), text (ref), textInput (ref), iconName (ref)
	local var1 = useLocalization({ DisplayNameCaption = textKeysModule.DisplayNameCaption })
	local var2 = useDisplayNameTextModule()
	local var3, var4 = reactModule.useState(p1.initialDisplayName)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(var2.displayNameChangeError)
	local var9, var10 = reactModule.useState(false)
	local var11 = reactModule.useRef(setTimeout(function() end, displayNameValidationNetworkDelay))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref), var9 (ref)
		if p1.updateErrorState then
			p1.updateErrorState(var5 or var9)
		end
	end, { var5, var9 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p1 (ref)
		var4(p1.initialDisplayName)
	end, { p1.initialDisplayName })
	
	local function getErrorMessage(p2)
		-- upvalues: constantsModule (copy), var2 (ref)
		return ({
			[constantsModule.DisplayNameValidationErrorCodes.TooShort] = var2.nameTooShortError,
			[constantsModule.DisplayNameValidationErrorCodes.TooLong] = var2.nameTooLongError,
			[constantsModule.DisplayNameValidationErrorCodes.InvalidCharacters] = var2.nameUnsupportedCharsError,
			[constantsModule.DisplayNameValidationErrorCodes.Moderated] = var2.nameInappropriateError,
			[constantsModule.DisplayNameValidationErrorCodes.Throttled] = var2.nameHasChangedError,
			[constantsModule.DisplayNameValidationErrorCodes.InvalidCharacterSetCombination] = var2.displayNameChangeMixedCharactersError,
			[constantsModule.DisplayNameValidationErrorCodes.NameNotAvailable] = var2.nameNotAvailableError
		})[p2] or var2.displayNameChangeError
	end
	
	local function textChanged(p2)
		-- upvalues: clearTimeout (copy), var11 (ref), var4 (ref), var6 (ref), var10 (ref), minDisplayNameCharacters (copy), analyticsServiceV2Module (copy), var8 (ref), var2 (ref), maxDisplayNameCharacters (copy), setTimeout (copy), p1 (ref), getErrorMessage (ref), displayNameValidationNetworkDelay (copy)
		clearTimeout(var11.current)
		p2 = p2 or ""
		local var12 = utf8.len(p2) or 0
		var4(p2)
		var6(false)
		var10(false)
		
		if var12 < minDisplayNameCharacters then
			analyticsServiceV2Module.sendDisplayNameTooShort(p2)
			var8(var2.nameTooShortError)
			var6(true)
			
			return
		elseif maxDisplayNameCharacters < var12 then
			var8(var2.nameTooLongError)
			var6(true)
			
			return
		end
		var10(true)
		var11.current = setTimeout(function()
			-- upvalues: p1 (copy), p2 (write), var6 (copy), var10 (copy), analyticsServiceV2Module (copy), var8 (copy), getErrorMessage (copy)
			p1.validateDisplayName(p2):andThen(function(_)
				-- upvalues: var6 (copy), var10 (copy), p1 (copy), p2 (copy)
				var6(false)
				var10(false)
				p1.onDataChange(p2)
			end):catch(function(p3)
				-- upvalues: analyticsServiceV2Module (copy), p2 (copy), var8 (copy), getErrorMessage (copy), var6 (copy), var10 (copy)
				local var13 = if p3 and p3.errors and p3.errors[1] then p3.errors[1].code or -1 else -1
				analyticsServiceV2Module.sendFilteredDisplayName(p2)
				var8(getErrorMessage(var13))
				var6(true)
				var10(false)
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
			Text = var1.DisplayNameCaption
		}),
		DisplayNameInput = reactModule.createElement(textInput, {
			LayoutOrder = 2,
			label = "",
			tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left",
			text = var3,
			width = UDim.new(1, 0),
			placeholder = p1.initialDisplayName,
			hint = if var5 then var7 else string.format("%d/%d", utf8.len(var3 or "") or 0, maxDisplayNameCharacters),
			onChanged = function(p2)
				-- upvalues: textChanged (ref)
				textChanged(p2)
			end,
			hasError = var5,
			iconTrailing = if var3 and #var3 > 0 then {
				name = iconName.CircleX,
				onActivated = function()
					-- upvalues: textChanged (ref)
					textChanged("")
				end
			} else nil,
			textBoxRef = p1.textBoxRef
		})
	})
end