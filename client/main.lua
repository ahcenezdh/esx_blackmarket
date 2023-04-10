
--------- SHOP
function openBlackMarket(data)
	local Options = {}
    for i = 1, #data.Items, 1 do
		Options[i] = {
			title = data.Items[i].name,
			description = "Prix: "..data.Items[i].prix.."$",
			args = {
				title = data.Items[i].name,
				item = data.Items[i].item,
				price = data.Items[i].prix,
			},
			image = data.Items[i].image,
			onSelect = function (args)
				local input = lib.inputDialog(args.title, {
					{type = 'number', description = 'Combien en voulez vous', icon = 'dollar-sign'},
				})
				if not input or input[1] == 0 then
					lib.notify({
						title = '??????',
						description = "Vous n'avez pas mis le bon montant",
						position = 'top-right',
						style = {
							backgroundColor = '#000000',
							color = '#FFFFFF'
						},
						icon = 'mask',
						iconColor = '#FFFFFF'
					})
					return 
				else 
					TriggerServerEvent('esx_blackmarket:grossiste', args, input[1])
				end
			end
		}
	end
	lib.registerContext({
		id = 'black_menu',
		title = data.menu,
		options = Options,
	})
	lib.showContext('black_menu')
end

------------- ZONES
for _,v in pairs (Config.Zones) do
	exports.ox_target:addSphereZone({
		coords = v.Pos,
		radius = 1,
		options = {
			{
				name = v.message,
				icon = v.icon,
				label = v.message,
				groups = v.job2,
				onSelect = function ()
					openBlackMarket(v)
				end
			}
		}
	})
end

-- peds
CreateThread(function()
	for _,v in pairs(Config.Zones) do
		lib.RequestModel(v.PedName)
    	ped = CreatePed("PED_TYPE_CIVMALE", v.PedName, v.Pos.x, v.Pos.y, v.Pos.z-1, v.Heading, false, true)
    	SetBlockingOfNonTemporaryEvents(ped, true)
    	FreezeEntityPosition(ped, true)
    	SetEntityInvincible(ped, true)
    	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, 1)
	end
end)
