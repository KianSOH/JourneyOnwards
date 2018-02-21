package projecteulerproblem15;

public class ProjectEulerProblem15 {

    private static long paths;

    public static void main(String[] args) {
        doPath(0, 0, 20);
        System.out.println(paths);
    }

    public static void doPath(int x, int y, int gridSize) {
        ++paths;

        for (;;) {
            if (x < gridSize && y < gridSize) {
                doPath(x, y + 1, gridSize);

                x++;
            } else if (x == gridSize && y < gridSize) {
                y++;
            } else if (y == gridSize && x < gridSize) {
                x++;
            } else if (y == gridSize && x == gridSize) {
                break;
            }
        }
    }
}