import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.druid.DruidPlugin;

public class GenerateTest {
    public static void main(String[] args) {
        PropKit.use("db.properties");

        DruidPlugin druidPlugin = new DruidPlugin(PropKit.get("jdbc"), PropKit.get("user"),PropKit.get("password"),PropKit.get("driver"));

        druidPlugin.start();
        // base model 所使用的包名
        String baseModelPkg = "model.base";
// base model 文件保存路径
        String baseModelDir = PathKit.getWebRootPath() + "/../src/model/base";

// model 所使用的包名
        String modelPkg = "model";
// model 文件保存路径
        String modelDir = baseModelDir + "/..";

        Generator gernerator = new Generator(druidPlugin.getDataSource(), baseModelPkg, baseModelDir, modelPkg, modelDir);
        gernerator.generate();
    }
}
