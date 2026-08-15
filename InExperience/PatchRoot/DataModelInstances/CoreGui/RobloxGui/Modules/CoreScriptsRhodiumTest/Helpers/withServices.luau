local httpService = game:GetService("HttpService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local constants = UIBloxModule.App.Style.Constants

local function dumpInstanceTree(p0, p1) --[[ line: 14 ]]
	-- upvalues: dumpInstanceTree (ref)
	p1 = p1 or ""
	
	if p0 == nil then
		print(p1 .. "[nil Instance]")
		
		return
	end
	print(p1 .. p0.Name)
	p1 ..= "  "
	
	for i, v in ipairs(p0:GetChildren()) do
		dumpInstanceTree(v, p1)
	end
end

return function(p2, p3, p4, p5, p6) --[[ line: 41 ]]
	-- upvalues: roduxModule (ref), roactModule (ref), roactRoduxModule (ref), appStyleProvider (ref), constants (ref), httpService (ref), coreGuiService (ref), dumpInstanceTree (ref)
	local text = "Test-" .. httpService:GenerateGUID(false)
	local var9 = roactModule.mount(roactModule.createElement("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, {
		[tostring(p3)] = roactModule.createElement(roactRoduxModule.StoreProvider, {
			store = roduxModule.Store.new(p4, p5 or {}, { roduxModule.thunkMiddleware })
		}, {
			AppStyleProvider = roactModule.createElement(appStyleProvider, {
				style = {
					themeName = constants.ThemeName.Dark,
					fontName = constants.FontName.Gotham
				}
			}, {
				Folder = roactModule.createElement("Folder", {}, { Root = roactModule.createElement(p3, p6 or {}) })
			})
		})
	}), coreGuiService, text)
	local var10 = ("game.CoreGui.%s.*[ClassName=Folder].*"):format(text)
	local ok, status = pcall(function() --[[ line: 74 ]]
		-- upvalues: p2 (ref), var10 (ref)
		p2(var10)
	end)
	
	if not ok then
		print("Test instance tree:\n")
		dumpInstanceTree(coreGuiService:FindFirstChild(text))
		print()
	end
	roactModule.unmount(var9)
	
	if not ok then
		error(status)
	end
end