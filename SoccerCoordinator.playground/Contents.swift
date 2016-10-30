/*:

 # Scout Coordinator
 
 This is the first project in the iOS course at Treehouse. It takes 18
 students and divides them up into three teams, accounting for experience.
 Instructions explicitely forbid advanced Swifting.
 
 Players are represented as dictionaries, and the entirety of players is stored
 in the `playersInLeague` array. Teams are repsented in the same way and are
 stored in the `teamsInLeague` array.
 
 Each team has a mutatable array of players.

 There are three hardcoded values that help the program execute:
 - experiencedPlayerCount: describes the total number of experienced players in 
   the league.
 - maxExperiencedPlayerPerTeam: describes the max number of experienced players 
   allowed on a team.
 - maxPlayersPerTeam: describes the total number of players allowed on a team.
 
 Given more time and leeway, it would be interesting to have these compute based
 on the aforementioned data sets. Constants work fine for this example though.

*/

let playersInLeague: [[String:String]] = [
    ["name": "Joe Smith", "height": "42", "isExperienced": "YES", "guardians": "Jim and Jan Smith"],
    ["name": "Jill Tanner", "height": "46", "isExperienced": "YES", "guardians": "Clara Tanner"],
    ["name": "Bill Bon", "height": "43", "isExperienced": "YES", "guardians": "Sara and Jenny Bon"],
    ["name": "Eva Gordon", "height": "45", "isExperienced": "NO", "guardians": "Wendy and Mike Gordon"],
    ["name": "Matt Gill", "height": "40", "isExperienced": "NO", "guardians": "Charles and Sylvia Gill"],
    ["name": "Kimmy Stein", "height": "41", "isExperienced": "NO", "guardians": "Bill and Hillary Stein"],
    ["name": "Sammy Adams", "height": "45", "isExperienced": "NO", "guardians": "Jeff Adams"],
    ["name": "Karl Saygan", "height": "42", "isExperienced": "YES", "guardians": "Heather Bledsoe"],
    ["name": "Suzane Greenberg", "height": "44", "isExperienced": "YES", "guardians": "Henrietta Dumas"],
    ["name": "Sal Dali", "height": "41", "isExperienced": "NO", "guardians": "Gala Dali"],
    ["name": "Joe Kavalier", "height": "39", "isExperienced": "NO", "guardians": "Sam and Elaine Kavalier"],
    ["name": "Ben Finkelstein", "height": "44", "isExperienced": "NO", "guardians": "Aaron and Jill Finkelstein"],
    ["name": "Diego Soto", "height": "41", "isExperienced": "YES", "guardians": "Robin and Sarika Soto"],
    ["name": "Chloe Alaska", "height": "47", "isExperienced": "NO", "guardians": "David and Jamie Alaska"],
    ["name": "Arnold Willis", "height": "43", "isExperienced": "NO", "guardians": "Claire Willis"],
    ["name": "Phillip Helm", "height": "44", "isExperienced": "YES", "guardians": "Thomas Helm and Eva Jones"],
    ["name": "Les Clay", "height": "42", "isExperienced": "YES", "guardians": "Wynonna Brown"],
    ["name": "Herschel Krustofski", "height": "45", "isExperienced": "YES", "guardians": "Hyman and Rachel Krustofski"],
]

let teamsInLeague: [[String:String]] = [
    ["name": "Dragons", "firstPractice": "March 17, 1pm"],
    ["name": "Sharks", "firstPractice": "March 17, 3pm"],
    ["name": "Raptors", "firstPractice": "March 18, 1pm"],
]

var dragonPlayers: [[String:String]] = []
var sharkPlayers: [[String:String]] = []
var raptorPlayers: [[String:String]] = []

let experiencedPlayerCount: Int = 9
let maxExperiencedPlayerPerTeam: Int = 3
let maxPlayersPerTeam = 6

/**
 
 Get the players for any given team.
 
 - returns:
 An array of dictionaries
 
 - parameters:
    - team: Dictionary of the team.
 
*/

func playersOnTeam(team: [String:String]) -> [[String:String]] {
    if (team["name"] != nil && team["name"] == "Dragons") {
        return dragonPlayers
    } else if (team["name"] != nil && team["name"] == "Sharks") {
        return sharkPlayers
    } else {
        return raptorPlayers
    }
}

/**
 
 Determine if a player is experienced or not.
 
 - returns:
 true / false
 
 - parameters:
    - player: Dictionary of the player.
 
*/

func isPlayerExperienced(player: [String:String]) -> Bool {
    if (player["isExperienced"] != nil && player["isExperienced"] == "YES") {
        return true
    } else {
        return false
    }
}

/**
 
 Determine if a team is full or not
 
 - returns:
 true / false
 
 - parameters:
    - team: Dictionary of the team.
 
*/

func isTeamFull(team: [String:String]) -> Bool {
    return playersOnTeam(team: team).count >= maxPlayersPerTeam
}

/**
 
 Determine if a team is accepting any experienced players.
 
 - returns:
 true / false
 
 - parameters:
    - team: Dictionary of the team.
 
*/

func isTeamAcceptingExperiencedPlayers(team: [String:String]) -> Bool {
    var countOfExperiencedPlayers = 0

    for player in playersOnTeam(team: team) {
        if (isPlayerExperienced(player: player)) {
            countOfExperiencedPlayers = countOfExperiencedPlayers + 1
        }
    }

    return countOfExperiencedPlayers <= maxExperiencedPlayerPerTeam
}

/**
 
 Adds a player to the array of players for a given team.
 
 - parameters:
    - player: Dictionary of the player.
    - team: Dictionary of the team.
 
*/

func addPlayerToTeam(player: [String:String], team: [String:String]) {
    if (team["name"] != nil && team["name"] == "Dragons") {
        dragonPlayers.append(player)
    } else if (team["name"] != nil && team["name"] == "Sharks") {
        sharkPlayers.append(player)
    } else {
        raptorPlayers.append(player)
    }
}

/**

 Determines which team to place a player and then attempts to add that player.
 
 - parameters:
    - player: Dictionary of the player.

*/

func placePlayerOnTeam(player: [String:String]) {
    for team in teamsInLeague {
        if (isTeamFull(team: team)) || (isPlayerExperienced(player: player)) && !(isTeamAcceptingExperiencedPlayers(team: team)) {
            continue
        } else {
            addPlayerToTeam(player: player, team: team)
        }
    }
}

/**
 
 Generates a letter based on data found in the player and team dictionaries.
 
 - returns:
 A string containing the personalized letter.
 
 - parameters:
    - player: Dictionary of the player.
    - team: Dictionary of the team.

*/

func generateLetter(player: [String:String], team: [String:String]) -> String {
    return "Hi \(player["guardians"]),\n" +
           "\(player["name"]) has been placed on the \(team["name"]).\n\n" +
           "Please have \(player["name"]) show up to practice on \(team["firstPractice"])!\n\n" +
           "Thanks,\nThe Soccor People"
}

/**:
 
 This is where the actual program executes. I loop through each player and place
 them on a team. When that loop has finished, I generate personalized letters for
 each player according to their team.

*/

for player in playersInLeague {
    placePlayerOnTeam(player: player)
}

for team in teamsInLeague {
    for player in playersOnTeam(team: team) {
        print(generateLetter(player: player, team: team))
    }
}
