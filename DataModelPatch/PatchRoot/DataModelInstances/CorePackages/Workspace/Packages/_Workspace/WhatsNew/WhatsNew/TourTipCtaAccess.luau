local WhatsNew = script:FindFirstAncestor("WhatsNew")
local EnumsModule = require(WhatsNew.Enums)
local _ = require(WhatsNew.Types)

local function _(p1, Kind, p2)
	assert(p1.kind == Kind, `TourTipCta field '{p2}' is not defined for kind '{p0.kind}' (expected '{Kind}')`)
end

return {
	none = function()
		-- upvalues: EnumsModule (copy)
		return { kind = EnumsModule.TourTipCtaKind.None }
	end,
	menu = function(Menu)
		-- upvalues: EnumsModule (copy)
		return { kind = EnumsModule.TourTipCtaKind.Menu, menu = Menu }
	end,
	nested = function(OpenActionKey, CloseActionKey, Scope)
		-- upvalues: EnumsModule (copy)
		return {
			kind = EnumsModule.TourTipCtaKind.Nested,
			openActionKey = OpenActionKey,
			closeActionKey = CloseActionKey,
			scope = Scope
		}
	end,
	wrap = function(p3)
		-- upvalues: EnumsModule (copy)
		return {
			getKind = function(_)
				-- upvalues: p3 (copy)
				return p3.kind
			end,
			getMenu = function(_)
				-- upvalues: p3 (copy), EnumsModule (upval)
				local Menu = EnumsModule.TourTipCtaKind.Menu
				assert(p3.kind == Menu, `TourTipCta field 'menu' is not defined for kind '{p3.kind}' (expected '{Menu}')`)
				
				return p3.menu
			end,
			setMenu = function(_, Menu)
				-- upvalues: p3 (copy), EnumsModule (upval)
				local Menu1 = EnumsModule.TourTipCtaKind.Menu
				assert(p3.kind == Menu1, `TourTipCta field 'menu' is not defined for kind '{p3.kind}' (expected '{Menu1}')`)
				p3.menu = Menu
			end,
			getOpenActionKey = function(_)
				-- upvalues: p3 (copy), EnumsModule (upval)
				local Nested = EnumsModule.TourTipCtaKind.Nested
				assert(p3.kind == Nested, `TourTipCta field 'openActionKey' is not defined for kind '{p3.kind}' (expected '{Nested}')`)
				
				return p3.openActionKey
			end,
			setOpenActionKey = function(_, OpenActionKey)
				-- upvalues: p3 (copy), EnumsModule (upval)
				local Nested = EnumsModule.TourTipCtaKind.Nested
				assert(p3.kind == Nested, `TourTipCta field 'openActionKey' is not defined for kind '{p3.kind}' (expected '{Nested}')`)
				p3.openActionKey = OpenActionKey
			end,
			getCloseActionKey = function(_)
				-- upvalues: p3 (copy), EnumsModule (upval)
				local Nested = EnumsModule.TourTipCtaKind.Nested
				assert(p3.kind == Nested, `TourTipCta field 'closeActionKey' is not defined for kind '{p3.kind}' (expected '{Nested}')`)
				
				return p3.closeActionKey
			end,
			setCloseActionKey = function(_, CloseActionKey)
				-- upvalues: p3 (copy), EnumsModule (upval)
				local Nested = EnumsModule.TourTipCtaKind.Nested
				assert(p3.kind == Nested, `TourTipCta field 'closeActionKey' is not defined for kind '{p3.kind}' (expected '{Nested}')`)
				p3.closeActionKey = CloseActionKey
			end,
			getScope = function(_)
				-- upvalues: p3 (copy), EnumsModule (upval)
				local Nested = EnumsModule.TourTipCtaKind.Nested
				assert(p3.kind == Nested, `TourTipCta field 'scope' is not defined for kind '{p3.kind}' (expected '{Nested}')`)
				
				return p3.scope
			end,
			setScope = function(_, Scope)
				-- upvalues: p3 (copy), EnumsModule (upval)
				local Nested = EnumsModule.TourTipCtaKind.Nested
				assert(p3.kind == Nested, `TourTipCta field 'scope' is not defined for kind '{p3.kind}' (expected '{Nested}')`)
				p3.scope = Scope
			end,
			unwrap = function(_)
				-- upvalues: p3 (copy)
				return p3
			end
		}
	end
}