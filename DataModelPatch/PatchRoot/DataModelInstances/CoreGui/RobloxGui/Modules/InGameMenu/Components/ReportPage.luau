local Players = game:GetService("Players")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local PageNavigationWatcherModule = require(Parent.Components.PageNavigationWatcher)
local PageModule = require(Parent.Components.Page)
local ReportListModule = require(script.ReportList)

local function getReportablePlayers()
	-- upvalues: Players (copy)
	local List = {}
	
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= Players.LocalPlayer then
			table.insert(List, player)
		end
	end
	return List
end

local ReportPage = Roact.PureComponent:extend("ReportPage")
ReportPage.validateProps = T.strictInterface({ pageTitle = T.string })

function ReportPage.init(p1)
	-- upvalues: getReportablePlayers (copy)
	p1:setState({ players = getReportablePlayers() })
end

function ReportPage.render(p1)
	-- upvalues: Roact (copy), PageModule (copy), ReportListModule (copy), PageNavigationWatcherModule (copy), getReportablePlayers (copy)
	return Roact.createElement(PageModule, { pageTitle = p1.props.pageTitle }, {
		PlayerList = Roact.createElement(ReportListModule, { players = p1.state.players }),
		Watcher = Roact.createElement(PageNavigationWatcherModule, {
			desiredPage = "Report",
			onNavigateTo = function()
				-- upvalues: p1 (copy), getReportablePlayers (upval)
				p1:setState({ players = getReportablePlayers() })
			end
		})
	})
end

return ReportPage